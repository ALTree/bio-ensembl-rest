require_relative 'helper'

class TestTaxonomy < Test::Unit::TestCase

  context 'test taxonomy_id' do 

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      tax = Taxonomy.taxonomy_id '9606'
      assert tax.index 'Homo sapiens'           # the species with ID 9606
      assert tax.index 'Neandertal'             # one if his sons
      assert tax.index '63221'                  # neandertal has this ID
    end

    should 'work both with name and NBCI taxon id' do
      name = Taxonomy.taxonomy_id 'Homo sapiens'
      taxon_name = Taxonomy.taxonomy_id '9606'
      assert_equal name, taxon_name
    end

  end


  context 'test taxonomy_classification' do 

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      tax = Taxonomy.taxonomy_classification 'Homo'
      assert tax.index '9605'           # the ID of Homo
      assert tax.index 'Homo sapiens'   # one of his children
      assert tax.index '9606'           # has this ID
      assert tax.index 'man'            # and this common name
    end

    should 'work both with name and NBCI taxon id' do
      name = Taxonomy.taxonomy_classification 'Homo sapiens'
      taxon_name = Taxonomy.taxonomy_classification '9606'
      assert_equal name, taxon_name
    end

  end




end