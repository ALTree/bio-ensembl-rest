require_relative 'helper'

class TestFeatures < Test::Unit::TestCase

  context 'feature_id' do 

    setup do       
      BioEnsemblRest.connect_db
      require 'json'
    end

    should 'return a json object' do 
      fts = Features.feature_id 'ENSG00000157764', %w(gene), format: 'json'
      assert_nothing_raised { JSON.parse fts }
    end

    should 'support multiple features' do 
      assert_nothing_raised do 
        Features.feature_id 'ENSG00000157764', %w(gene transcript exon), 
          format: 'json'
      end
    end

    should 'raise error if no feature is given' do 
      assert_raises RuntimeError do 
        Features.feature_id 'ENSG00000157764', format: 'json'
      end
    end

    should 'return a ruby objcted' do 
      fts = Features.feature_id 'ENSG00000157764', %w(gene), format: 'ruby'
      assert_instance_of Array, fts 
    end

    should 'support a bunch of parameters' do 
      assert_nothing_raised do 
        Features.feature_id 'ENSG00000157764', %w(gene transcript cds exon),
          format: 'xml',
          biotype: 'protein_coding',
          db_type: 'core',
          object_type: 'gene',
          species: 'homo_sapiens'
      end

    end

  end


  context 'feature_region' do 

    setup do       
      BioEnsemblRest.connect_db
      require 'json'
    end

    should 'return a json object' do 
      fts = Features.feature_region 'human', '7:140424943-140624564',
              %w(gene), 
              format: 'json'
      assert_nothing_raised { JSON.parse fts }
    end

    should 'support multiple features' do 
      assert_nothing_raised do 
        Features.feature_region 'human', '7:140424943-140624564',
          %w(variation constrained regulatory),
          format: 'json'
      end
    end

    should 'raise error if no feature is given' do 
      assert_raises RuntimeError do 
        Features.feature_region 'human', '7:140424943-140624564', format: 'xml'
      end
    end

    should 'support a bunch of parameters' do 
      assert_nothing_raised do 
        Features.feature_region 'human', '7:140424943-140624564',
          %w(gene transcript cds exon),
          format: 'xml',
          biotype: 'protein_coding',
          db_type: 'core'
      end
    end

  end


  end