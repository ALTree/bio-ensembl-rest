require_relative 'helper'

class TestVariation < Test::Unit::TestCase

  context 'test vep_id' do 

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do 
      var = Variation.vep_id 'COSM476', 'human'
      assert var.index '7'           # variation we asked for is on chromosome 7
      assert var.index '140453136'   # and starts here
    end

    should 'return the correct data' do 
      data = JSON.parse Variation.vep_id 'COSM476', 'human'
      var = data['data'].first
      assert var['name'] == 'COSM476'
      assert var['is_somatic'] == 1
      assert var['location']['start'] = 140453136
      assert var['location']['end'] = 140453136
    end

    should 'support rs ID' do
      var = Variation.vep_id 'rs116035550', 'human'
      assert var.index '11'           # variation we asked for is on chromosome 11
      assert var.index '212464'       # and starts here
    end

    sleep(1)

  end


  context 'test vep_region' do 

    setup do 
      EnsemblRest.connect_db
      require 'rexml/document'
    end

    should 'support a basic call and return the correct data' do 
      var = Variation.vep_region 'C', '9:22125503-22125502:1', 'human' 
      assert var.index '9'           # variation we asked for is on chromosome 7
      assert var.index '2125503'     # starts here
      assert var.index '22125502'    # and ends here
    end

    should 'return an xml object' do 
      var = Variation.vep_region 'C', '9:22125503-22125502:1', 'human',
              response: 'xml'
      assert_nothing_raised { REXML::Document.new var }
    end

    sleep(1)

  end


end