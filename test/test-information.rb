require_relative 'helper'

class TestInformation < Test::Unit::TestCase

  context 'assembly_info' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      info = Information.assembly_info 'homo_sapiens'
      assert info =~ /GRCh\d{2}/       # check for GRC assembly code  
      assert info.index 'X'            # check for X chromosome
      assert info.index 'Y'            # check for Y chromosome
    end

    sleep(1)

  end


  context 'assembly_info_region' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      info = Information.assembly_info_region 'homo_sapiens', 'X'
      assert info.index '155270560'         # the length of the X chromosome
      assert info.index 'chromosome'        # coordinate_system should be this
    end

  end


  context 'info_comparas' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      info = Information.info_comparas
      assert info.index 'comparas'         
      assert info.index 'name'         # we expect at least name and release 
      assert info.index 'release'      # number of the databases
    end

    sleep(1)

  end


  context 'info_data' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      info = Information.info_data       
      assert info.index 'releases'         # we expect a release number
    end

    sleep(1)

  end


  context 'info_ping' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      info = Information.info_ping       
      assert info.index 'ping'
      assert info.index '1'            # so we know the server is alive
    end

    sleep(1)

  end


  context 'info_rest' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      info = Information.info_rest      
      assert info.index 'release'            # we expect a release number
    end

    sleep(1)

  end


  context 'info_software' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      info = Information.info_software      
      assert info.index 'release'            # we expect a release number
    end

    sleep(1)

  end


  context 'info_species' do

    setup do 
      EnsemblRest.connect_db
    end

    should 'support a basic call and return the correct data' do
      info = Information.info_species division: 'ensembl'      
      assert info.index 'saccharomyces_cerevisiae'   # yeast! everyone has that
      assert info.index 'vicugna pacos'              # ALPACA! everyone loves them
    end

  end



end
