require_relative 'helper'

class TestComparativeGenomics < Test::Unit::TestCase

  context 'genetree_id' do 

    setup do 
      EnsemblRest.connect_db
      require 'rexml/document'
    end

    should 'work with different nh tree formats' do
      assert_nothing_raised do
        ComparativeGenomics.genetree_id 'ENSGT00390000003602',
          format: 'nh'
        ComparativeGenomics.genetree_id 'ENSGT00390000003602',
          format: 'nh',
          nh_format: 'full'
       ComparativeGenomics.genetree_id 'ENSGT00390000003602',
          format: 'nh',
          nh_format: 'ncbi_name'
      end
    end

    should 'return phyloxml tree' do
      tree = ComparativeGenomics.genetree_id 'ENSGT00390000003602',
              format: 'phyloxml'
      tree2 = ComparativeGenomics.genetree_id 'ENSGT00390000003602',
                format: 'xml'
      assert_nothing_raised do
        REXML::Document.new tree
        REXML::Document.new tree2
        end      
    end

    should 'return a Bio::PhyloXML object' do
      tree = ComparativeGenomics.genetree_id 'ENSGT00390000003602',
              format: 'ruby' 
      assert_instance_of Bio::PhyloXML::Parser, tree
    end

    should 'work allow the aligned parameter' do
      assert_nothing_raised do
        ComparativeGenomics.genetree_id 'ENSGT00390000003602',
          aligned: true
      end
    end

    should 'work allow the sequence type option' do
      assert_nothing_raised do
        ComparativeGenomics.genetree_id 'ENSGT00390000003602',
          sequence: 'none'
        ComparativeGenomics.genetree_id 'ENSGT00390000003602',
          sequence: 'cdna'
        ComparativeGenomics.genetree_id 'ENSGT00390000003602',
          sequence: 'protein'
      end
    end

  end


  context 'genetree_member_id' do 

    setup do 
      EnsemblRest.connect_db
    end

    should "work, that's all" do
      assert_nothing_raised do
        ComparativeGenomics.genetree_member_id 'ENSG00000157764'
      end
    end

    should 'return a Bio::PhyloXML object' do
      tree = ComparativeGenomics.genetree_member_id'ENSG00000157764',
              format: 'ruby' 
      assert_instance_of Bio::PhyloXML::Parser, tree
    end

  end


  context 'genetree_member_symbol' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'return a tree with the BRCA2 gene' do
      tree = ComparativeGenomics.genetree_member_symbol 'homo_sapiens', 'BRCA2',
              format: 'phyloxml'
      assert tree.index('BRCA2')
    end

    should 'work with all the options' do 
      assert_nothing_raised do
        tree = ComparativeGenomics.genetree_member_symbol 'homo_sapiens', 'BRCA2',
                  format: 'nh',
                  db_type: 'core',
                  external_db: 'HGNC',
                  object: 'gene'
      end
    end

    should 'return a Bio::PhyloXML object' do
      tree = ComparativeGenomics.genetree_member_symbol 'homo_sapiens', 'BRCA2',
              format: 'ruby' 
      assert_instance_of Bio::PhyloXML::Parser, tree
    end

  end


  context 'homology_id' do 

    setup do
      EnsemblRest.connect_db
      require 'json'
      require 'rexml/document'
    end

    should 'return a json object' do
      hom = ComparativeGenomics.homology_id 'ENSG00000157764',
              format: 'json'
      assert_nothing_raised { JSON.parse hom }
    end

    should 'return a xml object' do
      hom = ComparativeGenomics.homology_id 'ENSG00000157764',
              format: 'xml'      
      assert_nothing_raised { REXML::Document.new hom }
    end

    should 'return a list of Homology objects' do 
      homs = ComparativeGenomics.homology_id 'ENSG00000157764', 
              format: 'ruby'
      homs.each { |hom| assert_instance_of Homology, hom }
    end

    should 'support the compara parameter' do
      assert_nothing_raised do 
        ComparativeGenomics.homology_id 'ENSG00000157764', compara: 'multi' 
      end   
    end

    should 'support condensed and type parameters' do 
      assert_nothing_raised do 
        ComparativeGenomics.homology_id 'ENSG00000157764',
          format: 'json',
          condensed: true,
          type: 'orthologues'
      end
    end

    should 'support target species and taxon parameters' do 
      assert_nothing_raised do 
        ComparativeGenomics.homology_id 'ENSG00000157764',
          format: 'json',
          taxon: 10090,
          species: 'cow',
          sequence: 'cdna'
      end
    end

  end
  

  context 'homology_symbol' do

    setup do
      EnsemblRest.connect_db
      require 'json'
      require 'rexml/document'
    end

    should 'return a json object' do
      hom = ComparativeGenomics.homology_symbol 'human', 'BRCA2',
              format: 'json'
      assert_nothing_raised { JSON.parse hom }
    end

    should 'return a xml object' do
      hom = ComparativeGenomics.homology_symbol 'human', 'BRCA2',
              format: 'xml'      
      assert_nothing_raised { REXML::Document.new hom }
    end

    should 'return a list of Homology objects' do 
      homs = ComparativeGenomics.homology_symbol 'human', 'BRCA2', 
              format: 'ruby'
      homs.each { |hom| assert_instance_of Homology, hom }
    end

    should 'support condensed and type parameters' do 
      assert_nothing_raised do 
        ComparativeGenomics.homology_symbol 'human', 'BRCA2',
          format: 'json',
          condensed: true,
          type: 'orthologues'
      end
    end

    should 'support target species and taxon parameters' do 
      assert_nothing_raised do 
        ComparativeGenomics.homology_symbol 'human', 'BRCA2',
          format: 'json',
          taxon: 10090,
          species: 'cow',
          sequence: 'cdna'
      end
    end

  end


end