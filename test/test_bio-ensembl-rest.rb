require_relative 'helper'

class TestSequence < Test::Unit::TestCase

  context 'sequence_id' do
    
    setup do
      BioEnsemblRest.connect_db
    end

    should 'return correct pairs' do
      seq = BioEnsemblRest::Sequence.sequence_id 'ENSVPAG00000001567', 
              format: 'string',
              type: 'genomic'
      assert_equal "ATGCGCACAG", seq[0..9]
    end

  end



end
