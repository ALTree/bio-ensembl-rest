require_relative 'helper'

class TestOntologies < Test::Unit::TestCase

  context 'test ontology_ancestor' do 

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      ont = Ontologies.ontology_ancestor 'GO:0005667'
      assert ont.index 'GO:0000120'       # GO:000566 should have this ancestor
      assert ont.index 'GO:0000126'       # and this 
      assert ont.index 'GO:0000127'       # and this
      assert ont.index 'GO:0097221'       # and this one, too
    end

    should 'work both with GO and EFO IDs' do
      assert_nothing_raised do
        Ontologies.ontology_ancestor 'GO:0005667' 
        Ontologies.ontology_ancestor 'EFO:0000493'
      end
    end

  end


  context 'test ontology_ancestor_chart' do 

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      ont = Ontologies.ontology_ancestor_chart 'GO:0005667'
      assert ont.index 'GO:0005575'       # GO:0005667 should have this ancestor
      assert ont.index 'GO:0005622'       # and this 
      assert ont.index 'GO:0005623'       # and this
      assert ont.index 'GO:0005654'       # and this one, too
    end

  end


  context 'test ontology_descendants' do 

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      ont = Ontologies.ontology_descendents 'GO:0005667'
      assert ont.index 'GO:0043234'       # GO:0005667 should have this descendent
      assert ont.index 'GO:0044451'       # and this 
      assert ont.index 'GO:0005654'       # and this
      assert ont.index 'GO:0043231'       # and this one, too
    end

    should 'support the subset parameter' do 
      ont1 = Ontologies.ontology_descendents 'GO:0005667', subset: 'goslim_generic'
      ont2 = Ontologies.ontology_descendents 'GO:0005667'
      assert ont1.size < ont2.size
    end

  end


  context 'test ontology_id' do 

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      ont = Ontologies.ontology_id 'GO:0005667'
      assert ont.index 'transcription factor complex'    # what GO:0005667 is
      assert ont.index 'GO:0000120'                      # a son of him
      assert ont.index 'GO:0044451'                      # his parent
    end

    should 'return a ruby object' do 
      ont = Ontologies.ontology_id 'GO:0005667', response: 'ruby'
      assert_instance_of Hash, ont
    end

  end


  context 'test ontology_name' do 

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      ont = Ontologies.ontology_name 'transcription factor complex'
      assert ont.index 'GO:0005667'       # ID of transcription factor complex
      assert ont.index 'GO:0000120'       # a son of him
      assert ont.index 'GO:0044451'       # his parent
    end

  end


end