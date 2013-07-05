require_relative 'helper'

class TestVariation < Test::Unit::TestCase

  context 'test vep_id' do 

    setup do 
      EnsemblRest.connect_db
    end

    should 'support diffent IDs systems' do 
      assert_nothing_raised do 
        JSON.parse Variation.vep_id 'COSM476', 'human'
        JSON.parse Variation.vep_id 'rs116035550', 'human'
      end
    end

    should 'return the correct data' do 
      data = JSON.parse Variation.vep_id 'COSM476', 'human'
      var = data['data'].first
      assert var['name'] == 'COSM476'
      assert var['is_somatic'] == 1
      assert var['location']['start'] = 140453136
      assert var['location']['end'] = 140453136
    end

  end


  context 'test vep_region' do 

    setup do 
      EnsemblRest.connect_db
      require 'rexml/document'
    end

    should 'return a json object' do 
      assert_nothing_raised do 
        JSON.parse Variation.vep_region 'C', '9:22125503-22125502:1', 'human' 
        JSON.parse Variation.vep_region 'T', '1:6524705:6524705', 'Homo Sapiens'
      end
    end

    should 'return an xml object' do 
      var = Variation.vep_region 'C', '9:22125503-22125502:1', 'human',
              response: 'xml'
      assert_nothing_raised { REXML::Document.new var }
    end

  end


end