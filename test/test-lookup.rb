require_relative 'helper'

class TestLookup < Test::Unit::TestCase

  context 'lookup_id' do 

    setup do 
      EnsemblRest.connect_db
      require 'json'
    end

    should 'return a json object' do
      look = Lookup.lookup_id 'ENSG00000157764'
      assert_nothing_raised { JSON.parse look }
    end

    should 'support the full parameter' do 
      look_plain = Lookup.lookup_id 'ENSG00000157764'
      look_full = Lookup.lookup_id 'ENSG00000157764', format: 'full'
      assert look_full.size > look_plain.size
    end

    should 'return the right object' do 
      look = JSON.parse Lookup.lookup_id 'ENSG00000157764', format: 'full'
      assert look['object_type'].casecmp 'gene'
      assert look['species'].casecmp 'homo_sapiens'
      assert look['start'] = 140424943
      assert look['end'] = 140624564
    end

    should 'support db_type parameter' do 
      look = JSON.parse Lookup.lookup_id 'ENSG00000157764', db_type: 'core'
      assert look['db_type'] = 'core'
    end

  end


end
