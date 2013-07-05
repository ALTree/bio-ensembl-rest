require_relative 'helper'

class TestMapping < Test::Unit::TestCase

  context 'test map' do 

    setup do 
      EnsemblRest.connect_db
    end

    should 'return a json object' do 
      map = Mapping.map 'NCBI36', 'GRCh37', 'human', 'X:1000000..1000100:1'
      assert_nothing_raised { JSON.parse map }
    end

    should 'return the right mapping' do 
      map = Mapping.map 'NCBI36', 'GRCh37', 'human', 'X:1000000..1000100:1', 
              response: 'ruby'
      from = map['mappings'][0]['original']
      to = map['mappings'][0]['mapped']
      assert from['start'] = 1000000
      assert from['end'] = 1000100
      assert from['assembly'] = 'NCBI36'
      assert to['start'] = 1080000
      assert to['end'] = 1080100
      assert to['assembly'] = 'GRCh37'
    end

  end


  context 'test map_from_cdna' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'return a json object' do 
      map = Mapping.map_from_cdna 'ENST00000288602', '100..300'
      assert_nothing_raised { JSON.parse map }
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


  context 'test map_from_cdna' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'return a json object' do 
      map = Mapping.map_from_region 'ENSP00000288602', '100..300'
      assert_nothing_raised { JSON.parse map }
    end

    should 'return the right mapping' do 
      map = Mapping.map_from_region 'ENSP00000288602', '100..300',
              response: 'ruby'
      from = map['mappings'][0]
      to = map['mappings'][1]
      from['seq_region_name'] = '7'
      from['start'] = 140534409
      to['end'] = 140534615
      from['seq_region_name'] = '7'
      from['start'] = 140508692
      to['end'] = 140508795 
    end

  end


end