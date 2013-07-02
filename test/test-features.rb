require_relative 'helper'

class TestFeatures < Test::Unit::TestCase

  context 'feature_id' do 

    setup do       
      EnsemblRest.connect_db
      require 'json'
    end

    should 'return the right data' do 
      fts = Features.feature_id 'ENSG00000157764', %w(gene), response: 'json'
      assert_nothing_raised { JSON.parse fts }
      assert fts.index 'BRAF'
    end


    should 'support multiple features' do 
      assert_nothing_raised do 
        Features.feature_id 'ENSG00000157764', %w(gene transcript exon), 
          response: 'json'
      end
    end

    should 'raise error if no feature is given' do 
      assert_raises RuntimeError do 
        Features.feature_id 'ENSG00000157764', response: 'json'
      end
    end

    should 'return a ruby object' do 
      fts = Features.feature_id 'ENSG00000157764', %w(gene), response: 'ruby'
      assert_instance_of Array, fts 
    end


  end


  context 'feature_region' do 

    setup do       
      EnsemblRest.connect_db
      require 'json'
    end

    should 'return the right data' do 
      fts = Features.feature_region 'human', '7:140424943-140624564',
              %w(gene), 
              response: 'json'
      assert_nothing_raised { JSON.parse fts }
      assert fts.index 'BRAF'
    end

    should 'support multiple features' do 
      assert_nothing_raised do 
        Features.feature_region 'human', '7:140424943-140624564',
          %w(variation constrained regulatory),
          response: 'json'
      end
    end

    should 'raise error if no feature is given' do 
      assert_raises RuntimeError do 
        Features.feature_region 'human', '7:140424943-140624564', response: 'xml'
      end
    end


  end


end