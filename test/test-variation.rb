require_relative 'helper'

class TestVariation < Test::Unit::TestCase

  context 'test vep_id' do 

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do 
      var = Variation.vep_id 'COSM476', 'human'
      assert var.index '7'           # variation we asked for is on chromosome 7
      assert var.index '140753336'   # and starts here  
    end

    sleep(1)

    should 'return the correct data' do 
      data = JSON.parse Variation.vep_id 'COSM476', 'human'
      var=data.first["colocated_variants"]
      assert var.first["id"] == 'COSM18443'
      assert var.first["somatic"] == 1
      assert var.first['start'] = 140753336
      assert var.first['end'] = 140753336 	

    end

    should 'support rs ID' do
      var = Variation.vep_id 'rs116035550', 'human'
      assert var.index '11'           # variation we asked for is on chromosome 11
      assert var.index '212464'       # and starts here
    end

    sleep(1)

  end

  context 'test vep_hgvs' do
    setup do
      EnsemblRest.connect_db
    end
  
    should 'support a basic call and return the correct data' do 
      var = Variation.vep_hgvs 'human', 'AGT:c.803T>C'
      assert var.index '230710048'          # start
      assert var.index '230710048'          # and end  
    end

    sleep(1)
  end

  context 'test variation-id' do
    setup do
      EnsemblRest.connect_db
    end
  
    should 'support a basic call and return the correct data' do 
      var = Variation.variation_id 'human', 'rs56116432'
      assert var.index 'GRCh38'             # assembly name
      assert var.index '133256042'          # and end                                             "
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
      assert var.index '2125502'     # starts here 
      assert var.index '22125502'    # and ends here 
    end

    should 'return an xml object' do 
      var = Variation.vep_region 'C', '9:22125503-22125502:1', 'human',
              response: 'xml'
      assert_nothing_raised { REXML::Document.new var }
    end

    should 'return a ruby object' do 
      var = Variation.vep_region 'C', '9:22125503-22125502:1', 'human', response: 'ruby'
      assert_instance_of Array, var
    end

    sleep(1)

  end


end
