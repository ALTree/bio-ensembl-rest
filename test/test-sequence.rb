require_relative 'helper'

class TestSequence < Test::Unit::TestCase

  context 'sequence_id' do
    
    setup do
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      seq = Sequence.sequence_id 'ENSG00000236597'
      seq2 = Sequence.sequence_id 'ENSG00000228131'
      assert_equal seq, 'CTAACTGGGGA'
      assert_equal seq2.size, 18
    end

    sleep(1)

    should 'expand the sequence 10 pairs upstream' do
      seq1 = Sequence.sequence_id 'ENSE00001154485',
              response: 'text',
              type: 'genomic'
      seq2 = Sequence.sequence_id 'ENSE00001154485',
              response: 'text',
              type: 'genomic',
              expand_5prime: 10
      assert_equal 10 + seq1.size, seq2.size
      assert_equal seq1, seq2[10..-1]
    end

    sleep(1)

    should 'return a Bio::Sequence object' do
      seq = Sequence.sequence_id 'ENSVPAG00000001567',
              response: 'ruby'
      assert_instance_of Bio::Sequence, seq
    end

    sleep(1)

    should 'return multiple sequences' do
      response = Sequence.sequence_id 'ENSG00000157764',
                  response: 'fasta', 
                  multiple_sequences: true,
                  type: 'protein'
      assert response.scan(/>\w{15,18}\n/).size > 1
    end

    sleep(1)

    should 'return masked sequences' do
      seq1 = Sequence.sequence_id 'ENST00000288602', 
              mask: 'hard'
      seq2 = Sequence.sequence_id 'ENST00000288602', 
              mask: 'soft'
      assert_equal 'N'*10, seq1[0..9]
      assert_equal seq2[0..9].downcase, seq2[0..9]
    end

  end


  context 'sequence_region' do

    setup do
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      seq = Sequence.sequence_region 'human', 'X:1000000..1000100:1'
      assert_equal 'GAAACAGCTACTTGG', seq[0..14]
      assert_equal seq.size, 101
    end

    should 'expand the sequence upstream and downstream' do
      seq = Sequence.sequence_region 'human',
              'X:1000000..1000100:1',
              expand_3prime: 50,
              expand_5prime: 50
      assert_equal 201, seq.size
    end

    sleep(1)

    should 'support json response' do
      seq = Sequence.sequence_region 'human',
              'X:1000000..1000100:1',  
              response: 'json'
      assert_nothing_raised { JSON.parse seq }
    end

    sleep(1)

    should 'return a Bio::Sequence object' do
      seq = Sequence.sequence_region 'human',
              'X:1000000..1000100:1',
              response: 'ruby'
      assert_instance_of Bio::Sequence, seq
      assert_equal 101, seq.to_s.size
    end

  end

end
