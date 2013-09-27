require_relative 'helper'

class TestFeatures < Test::Unit::TestCase

  context 'feature_id' do 

    setup do       
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      fts = Features.feature_id 'ENSG00000157764', %w(gene)
      assert fts.index 'ENSG00000157764'      # gene ID
      assert fts.index '140424943'            # gene starts here
      assert fts.index '140624564'            # gene end here
    end


    should 'support multiple features' do 
      assert_nothing_raised do 
        Features.feature_id 'ENSG00000157764', %w(gene transcript exon), 
          response: 'json'
      end
    end

    sleep(1)

    should 'raise error if no feature is given' do 
      assert_raises RuntimeError do 
        Features.feature_id 'ENSG00000157764', response: 'json'
      end
    end

    should 'return a ruby object' do 
      fts = Features.feature_id 'ENSG00000157764', %w(gene), response: 'ruby'
      assert_instance_of Array, fts 
    end

    sleep(1)

  end


  context 'feature_region' do 

    setup do       
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      fts = Features.feature_region 'human', '7:140424943-140624564', %w(gene)
      assert_nothing_raised { JSON.parse fts }
      assert fts.index 'ENSG00000157764'   # gene ID
      assert fts.index 'BRAF'              # gene name
      assert fts.index '140424943'         # gene starts here
      assert fts.index '140624564'         # gene end here
    end

    sleep(1)

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

    sleep(1)

  end

  context 'feature_translation' do

    setup do
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do 
      ft = Features.feature_translation 'ENSP00000288602'
      assert ft.index('SSF56112')
    end

  end


end