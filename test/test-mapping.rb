require_relative 'helper'

class TestMapping < Test::Unit::TestCase

  context 'test map' do 

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      map = Mapping.map 'NCBI36', 'GRCh37', 'human', 'X:1000000..1000100:1'
      assert map.index 'NCBI36'            # we asked a map from this
      assert map.index 'GRCh37'            # to this
      assert map.index 'X'                 # of a sequence on the X chromosome
    end

    should 'return work with response: ruby' do 
      map = Mapping.map 'NCBI36', 'GRCh37', 'human', 'X:1000000..1000100:1', 
              response: 'ruby'
      from = map['mappings'][0]['original']         # from here
      to = map['mappings'][0]['mapped']             # to here

      assert from['assembly'] = 'NCBI36'            # from has to be NCBI36
      assert from['start'] = 1000000                # its region start here
      assert from['end'] = 1000100                  # and ends here
      assert to['assembly'] = 'GRCh37'              # to has to be GRCh37
      assert to['start'] = 1080000                  # its region starts here
      assert to['end'] = 1080100                    # and ends here
    end

  end


  context 'test map_from_cdna' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do 
      map = Mapping.map_from_cdna 'ENST00000288602', '100..300'
      assert map.index 'chromosome'        # we asked a map on chromosome
      assert map.index '7'                 # chromosome 7, in fact
      assert map.index '-1'                # strand -1
    end

    should 'return the right mapping' do 
      map = Mapping.map_from_cdna 'ENST00000288602', '100..300',
              response: 'ruby'
      from = map['mappings'][0]
      to = map['mappings'][1]
      from['seq_region_name'] = '7'
      from['start'] = 140624366
      to['end'] = 140624465
      from['seq_region_name'] = '7'
      from['start'] = 140549912
      to['end'] = 140550012 
    end

  end

  context 'test map_from_cds' do

    setup do 
      EnsemblRest.connect_db
    end  

    should 'support a basic call and return the correct data' do 
      map = Mapping.map_from_cds 'ENST00000288602', '1..1000'
      assert map.index '7'                 # we asked for stuff on chromosome 7
      assert map.index '-1'                # strand -1
      assert map.index '140624366'         # one of the mapping starts here
      assert map.index '140624503'         # and ends here
    end

  end


  context 'test map_from_translation' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do 
      map = Mapping.map_from_translation 'ENSP00000288602', '100..300'
      assert map.index '7'                 # we asked for stuff on chromosome 7
      assert map.index '-1'                # strand -1
      assert map.index '140534409'         # one of the mapping starts here
      assert map.index '140534615'         # and ends here
    end

  end


end