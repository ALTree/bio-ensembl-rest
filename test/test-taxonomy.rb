require_relative 'helper'

class TestTaxonomy < Test::Unit::TestCase

  context 'test taxonomy_id' do 

    setup do 
      EnsemblRest.connect_db
    end

    should 'return the right data' do
      data = Taxonomy.taxonomy_id '9606', response: 'ruby'
      assert_equal "Homo sapiens", data['scientific_name']
    end

    should 'work both with name and NBCI taxon id' do
      name = Taxonomy.taxonomy_id 'Homo sapiens'
      taxon_name = Taxonomy.taxonomy_id '9606'
      assert_equal name, taxon_name
    end

  end


  context 'test taxonomy_name' do 

    setup do 
      EnsemblRest.connect_db
    end

    should 'work both with name and NBCI taxon id' do
      name = Taxonomy.taxonomy_classification 'Homo sapiens'
      taxon_name = Taxonomy.taxonomy_classification '9606'
      assert_equal name, taxon_name
    end

  end




end