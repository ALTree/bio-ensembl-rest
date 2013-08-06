require_relative 'helper'

class TestCrossReference < Test::Unit::TestCase

  context 'xrefs_id' do 

    setup do       
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      ref = CrossReference.xrefs_id 'ENSG00000157764'
      assert ref.index 'BRAF1'
    end

    should 'return a json object' do
      ref = CrossReference.xrefs_id 'ENSG00000157764'
      assert_nothing_raised { JSON.parse ref }
    end

    should 'return a ruby array' do
      refs = CrossReference.xrefs_id 'ENSG00000157764', response: 'ruby'
      assert_instance_of Array, refs
    end

    sleep(1)

  end


  context 'xrefs_name' do

    setup do       
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      ref = CrossReference.xrefs_name 'Homo sapiens', 'BRCA2'
      assert ref.index 'BRCA2'
      assert ref.index 'BRCC2'
      assert ref.index 'BROVCA2'
    end

    should 'return a JSON object' do
      refs = CrossReference.xrefs_name 'human', 'BRCA2', response: 'json'
      assert_nothing_raised { JSON.parse refs }
    end

    should 'return a ruby array' do
      refs = CrossReference.xrefs_name 'human', 'BRCA2', response: 'ruby'
      assert_instance_of Array, refs
    end

    sleep(1)

  end


  context 'xrefs_symbol' do

    setup do       
      EnsemblRest.connect_db
      require 'rexml/document'
    end

    should 'support a basic call and return the correct data' do
      ref = CrossReference.xrefs_symbol 'homo_sapiens', 'BRCA2'
      assert ref.index 'ENSG00000139618'
      assert ref.index 'ENST00000544455'
    end

    should 'return xml object' do
      refs = CrossReference.xrefs_symbol 'homo_sapiens', 'BRCA2', response: 'xml'
      assert_nothing_raised { REXML::Document.new refs }
    end

    sleep(1)

  end

end
