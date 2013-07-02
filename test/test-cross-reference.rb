require_relative 'helper'

class TestCrossReference < Test::Unit::TestCase

  context 'xrefs_id' do 

    setup do       
      EnsemblRest.connect_db
      require 'json'
    end

    should 'return a JSON object' do
      refs = CrossReference.xrefs_id 'ENSG00000157764', response: 'json'
      assert_nothing_raised { JSON.parse refs }
    end

    should 'return a ruby array' do
      refs = CrossReference.xrefs_id 'ENSG00000157764', response: 'ruby'
      assert_instance_of Array, refs
    end

    should 'work with various parameters' do
      assert_nothing_raised do
        CrossReference.xrefs_id 'ENST00000288602',
          response: 'xml',
          external_db: 'PDB',
          db_type: 'core',
          all_levels: true
        end
    end

  end


  context 'xrefs_name' do

    setup do       
      EnsemblRest.connect_db
      require 'json'
    end

    should 'return a JSON object' do
      refs = CrossReference.xrefs_name 'human', 'BRCA2', response: 'json'
      assert_nothing_raised { JSON.parse refs }
    end

    should 'return a ruby array' do
      refs = CrossReference.xrefs_name 'human', 'BRCA2', response: 'ruby'
      assert_instance_of Array, refs
    end

    should 'work with various parameters' do
      assert_nothing_raised do
        CrossReference.xrefs_name 'human', 'BRCA2',
          response: 'xml',
          external_db: 'PDB',
          db_type: 'otherfeatures'
        end
    end

  end


  context 'xrefs_symbol' do

    setup do       
      EnsemblRest.connect_db
      require 'rexml/document'
    end

    should 'return the right ensembl ID' do
      data = CrossReference.xrefs_symbol 'homo_sapiens', 'BRCA2', response: 'json'
      assert data.index('ENSG00000139618')
      assert data.index('ENST00000544455')
    end

    should 'return xml object' do
      refs = CrossReference.xrefs_symbol 'homo_sapiens', 'BRCA2', response: 'xml'
      assert_nothing_raised { REXML::Document.new refs }
    end

  end

end
