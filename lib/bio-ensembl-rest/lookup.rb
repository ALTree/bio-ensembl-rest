module EnsemblRest
  module Lookup

    ##
    # Query for an identifier's location in the available Ensembl databases
    def self.lookup_id(id, opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/lookup/id/#{id}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse lookup_id id, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'lookup' 
    end


   # Find the species and database for a symbol in a linked external database
    def self.lookup_symbol(species, symbol, opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/lookup/symbol/#{species}/#{symbol}", opts
      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse lookup_symbol species, symbol, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'lookup' 
    end


  end
end
