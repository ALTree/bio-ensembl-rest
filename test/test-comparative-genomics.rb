require_relative 'helper'

class TestComparativeGenomics < Test::Unit::TestCase

  context 'genetree_id' do 

    setup do 
      EnsemblRest.connect_db
      require 'rexml/document'
    end

    should 'work with different nh tree formats' do
      tree1 = ComparativeGenomics.genetree_id 'ENSGT00390000003602',
                response: 'nh',
                nh_format: 'species_short_name'
      tree2 = ComparativeGenomics.genetree_id 'ENSGT00390000003602',
                response: 'nh',
                nh_format: 'species'
      assert tree1.size < tree2.size
    end

    should 'return the right data' do
      tree = ComparativeGenomics.genetree_id 'ENSGT00390000003602',
              response: 'xml'
      assert tree.index('Euteleostomi') && tree.index('Sarcopterygii')
    end

    should 'return a Bio::PhyloXML object' do
      tree = ComparativeGenomics.genetree_id 'ENSGT00390000003602',
              response: 'ruby' 
      assert_instance_of Bio::PhyloXML::Parser, tree
    end


  end


  context 'genetree_member_id' do 

    setup do 
      EnsemblRest.connect_db
    end

    should "return the right data" do
      tree = ComparativeGenomics.genetree_member_id'ENSG00000157764', response: 'xml'
      assert tree.index('Bilateria')
    end

    should 'return a Bio::PhyloXML object' do
      tree = ComparativeGenomics.genetree_member_id'ENSG00000157764',
              response: 'ruby' 
      assert_instance_of Bio::PhyloXML::Parser, tree
    end

  end


  context 'genetree_member_symbol' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'return a tree with the BRCA2 gene' do
      tree = ComparativeGenomics.genetree_member_symbol 'homo_sapiens', 'BRCA2',
              response: 'phyloxml'
      assert tree.index('BRCA2')
    end

  end


  context 'homology_id' do 

    setup do
      EnsemblRest.connect_db
      require 'rexml/document'
    end

    should 'return a json object' do
      hom = ComparativeGenomics.homology_id 'ENSG00000157764',
              response: 'json'
      assert_nothing_raised { JSON.parse hom }
    end

    should 'return a xml object' do
      hom = ComparativeGenomics.homology_id 'ENSG00000157764',
              response: 'xml'      
      assert_nothing_raised { REXML::Document.new hom }
    end

    should 'support the sequence parameter' do 
      hom = ComparativeGenomics.homology_id 'ENSG00000157764', sequence: 'none'
      hom2 = ComparativeGenomics.homology_id 'ENSG00000157764', sequence: 'protein'
      assert hom.size < hom2.size
    end

    should 'return a list of Homology objects' do 
      homs = ComparativeGenomics.homology_id 'ENSG00000157764', 
              response: 'ruby'
      homs.each { |hom| assert_instance_of Homology, hom }
    end

    should 'support the aligned parameter' do
      al = ComparativeGenomics.homology_id 'ENSG00000157764'
      nal = ComparativeGenomics.homology_id 'ENSG00000157764', aligned: false
      assert al.size > nal.size
    end

  end
  

  context 'homology_symbol' do

    setup do
      EnsemblRest.connect_db
      require 'rexml/document'
    end

    should 'return a json object' do
      hom = ComparativeGenomics.homology_symbol 'human', 'BRCA2',
              response: 'json'
      assert_nothing_raised { JSON.parse hom }
    end

    should 'return a list of Homology objects' do 
      homs = ComparativeGenomics.homology_symbol 'human', 'BRCA2', 
              response: 'ruby'
      homs.each { |hom| assert_instance_of Homology, hom }
    end

  end


end