require_relative 'helper'

class TestOntologies < Test::Unit::TestCase

  context 'test ontology_ancestor' do 

    setup do 
      EnsemblRest.connect_db
      require 'json'
    end

    should 'work both with GO and EFO IDs' do
      go = Ontologies.ontology_ancestor 'GO:0005667' 
      efo = Ontologies.ontology_ancestor 'EFO:0000493'
      assert_nothing_raised { JSON.parse go }
      assert_nothing_raised { JSON.parse efo }
    end

  end


  context 'test ontology_ancestor_chart' do 

    setup do 
      EnsemblRest.connect_db
      require 'json'
    end

    should 'work both with GO and EFO IDs' do
      go = Ontologies.ontology_ancestor_chart 'GO:0005667' 
      efo = Ontologies.ontology_ancestor_chart 'EFO:0000493'
      assert_nothing_raised { JSON.parse go }
      assert_nothing_raised { JSON.parse efo }
    end

  end


  context 'test ontology_descendants' do 

    setup do 
      EnsemblRest.connect_db
      require 'json'
    end

    should 'work both with GO and EFO IDs' do
      go = Ontologies.ontology_descendents 'GO:0005667' 
      efo = Ontologies.ontology_descendents 'EFO:0000493'

      assert_nothing_raised { JSON.parse go }
      assert_nothing_raised { JSON.parse efo }
    end

    should 'support various distance parameters' do 
      assert_nothing_raised do 
        Ontologies.ontology_descendents 'GO:0005667', closest_term: true
        Ontologies.ontology_descendents 'GO:0005667', zero_distance: true
        Ontologies.ontology_descendents 'GO:0005667', subset: 'goslim_generic'
      end
    end

  end


  context 'test ontology_id' do 

    setup do 
      EnsemblRest.connect_db
      require 'json'
    end

    should 'work both with GO and EFO IDs' do
      go = Ontologies.ontology_id 'GO:0005667' 
      efo = Ontologies.ontology_id 'EFO:0000493'

      assert_nothing_raised { JSON.parse go }
      assert_nothing_raised { JSON.parse efo }
    end

    should 'return a ruby object' do 
      ont = Ontologies.ontology_id 'GO:0005667', response: 'ruby'
      assert_instance_of Hash, ont
    end

  end


  context 'test ontology_name' do 

    setup do 
      EnsemblRest.connect_db
      require 'json'
    end

    should 'return a json object' do 
      ont = Ontologies.ontology_name 'transcription factor complex'
      assert_nothing_raised { JSON.parse ont }
    end

  end


end