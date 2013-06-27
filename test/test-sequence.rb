require_relative 'helper'

class TestSequence < Test::Unit::TestCase

  context 'sequence_id' do
    
    setup do
      BioEnsemblRest.connect_db
      require 'json'
    end

    should 'return the correct string' do
      seq = Sequence.sequence_id 'ENSVPAG00000001567'
      assert_instance_of String, seq
      assert_equal 'ATGCGCACAGCTAAC', seq[0..14]
      assert_equal 'AAAAAGAGAAACTGA', seq[-15..-1]
    end

    should 'expand the sequence 10 pairs upstream' do
      seq1 = Sequence.sequence_id 'ENSE00001154485',
              format: 'text',
              type: 'genomic'
      seq2 = Sequence.sequence_id 'ENSE00001154485',
              format: 'text',
              type: 'genomic',
              expand_up: 10
      assert_equal 10 + seq1.size, seq2.size
      assert_equal seq1, seq2[10..-1]
    end

    should 'return a Bio::Sequence object' do
      seq = Sequence.sequence_id 'ENSVPAG00000001567',
              format: 'ruby'
      assert_instance_of Bio::Sequence, seq
    end

    should 'raise an error: ID not found' do
      assert_raises RuntimeError do
        Sequence.sequence_id 'CCDS5863.1',
          format: 'fasta',
          object_type: 'transcript',
          db_type: 'otherfeatures',
          type: 'cds',
          species: 'human'
        end
    end

    should 'return multiple sequences' do
      response = Sequence.sequence_id 'ENSG00000157764',
                  format: 'fasta', 
                  multiseq: true,
                  type: 'protein'
      assert response.scan(/>\w{15,18}\n/).size > 1
    end

    should 'support json response' do
      seq = Sequence.sequence_id 'ENSG00000157764',
              format: 'json'
      assert_nothing_raised {JSON.parse(seq)}
    end

    should 'return masked sequences' do
      seq1 = Sequence.sequence_id 'ENST00000288602', 
              mask: 'hard'
      assert_equal 'N'*10, seq1[0..9]

      seq2 = Sequence.sequence_id 'ENST00000288602', 
              mask: 'soft'
      assert_equal seq2[0..9].downcase, seq2[0..9]
    end

  end

  # TODO: aggiungi test con format: 'seqxml'

  context 'sequence_region' do

    setup do
      BioEnsemblRest.connect_db
      require 'json'
    end

    should 'return the correct string' do
      seq = Sequence.sequence_region 'human', 
              'X:1000000..1000100:1'
      assert_equal 'GAAACAGCTACTTGG', seq[0..14]
      assert_equal seq.size, 101
    end

    should 'works with different coords_systems' do
      assert_nothing_raised do
        Sequence.sequence_region 'human', 
            'AADC01095577.1:1..100',
            format: 'fasta',
            coords: 'seqlevel'
        end
    end

    should 'expand the sequence upstream and downstream' do
      seq = Sequence.sequence_region 'human',
              'X:1000000..1000100:1',
              expand_up: 50,
              expand_down: 50
      assert_equal 201, seq.size
    end

    should 'support json response' do
      seq = Sequence.sequence_region 'human',
              'X:1000000..1000100:1',  
              format: 'json'
      assert_nothing_raised {JSON.parse(seq)}
    end

    should 'return a Bio::Sequence object' do
      seq = Sequence.sequence_region 'human',
              'X:1000000..1000100:1',
              format: 'ruby'
      assert_instance_of Bio::Sequence, seq
    end

  end

end
