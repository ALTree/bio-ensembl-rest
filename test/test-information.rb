require_relative 'helper'

class TestInformation < Test::Unit::TestCase

  context 'assembly_info' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'return a json object' do 
      info = Information.assembly_info 'homo_sapiens', response: 'json'
      assert_nothing_raised { JSON.parse info }
    end

  end


  context 'assembly_info_region' do

    setup do 
      EnsemblRest.connect_db
      require 'rexml/document'
    end

    should 'return a xml object' do 
      info = Information.assembly_info_region 'homo_sapiens', 'X',
                response: 'xml'
      assert_nothing_raised { REXML::Document.new info }
    end

  end


  context 'info_comparas' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'return a json object' do 
      info = Information.info_comparas response: 'json'
      assert_nothing_raised { JSON.parse info }
    end

    should 'return a ruby object' do 
      info = Information.info_comparas response: 'ruby'
      assert_instance_of Hash, info
    end

  end


  context 'info_data' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'return a json object' do 
      info = Information.info_data response: 'json'
      assert_nothing_raised { JSON.parse info }
    end

    should 'return a ruby object' do 
      info = Information.info_data response: 'ruby'
      assert_instance_of Hash, info
    end

  end


  context 'info_ping' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'return a json object' do 
      info = Information.info_ping response: 'json'
      assert_nothing_raised { JSON.parse info }
    end

    should 'return a ruby object' do 
      info = Information.info_ping response: 'ruby'
      assert_instance_of Hash, info
    end

  end


  context 'info_rest' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'return a json object' do 
      info = Information.info_rest response: 'json'
      assert_nothing_raised { JSON.parse info }
    end

    should 'return a ruby object' do 
      info = Information.info_rest response: 'ruby'
      assert_instance_of Hash, info
    end

  end


  context 'info_software' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'return a json object' do 
      info = Information.info_software response: 'json'
      assert_nothing_raised { JSON.parse info }
    end

    should 'return a ruby object' do 
      info = Information.info_software response: 'ruby'
      assert_instance_of Hash, info
    end

  end


  context 'info_species' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'return a json object' do 
      info = Information.info_software response: 'json', division: 'ensembl'
      assert_nothing_raised { JSON.parse info }
    end

  end



end
