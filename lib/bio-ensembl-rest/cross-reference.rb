module EnsemblRest
  module CrossReference

    ##
    # Perform lookups of Ensembl Identifiers and retrieve their external cross 
    # references in other databases
    def self.xrefs_id(id, opts = {})
      opts = EnsemblRest.parse_options opts, 'crossreference'
      path = EnsemblRest.build_path "/xrefs/id/#{id}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse xrefs_id id, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'crossreference'      
    end


    ##
    # Performs a lookup based upon the primary accession or display label of 
    # an external reference and returning the information we hold about the entry
    def self.xrefs_name(species, name, opts = {})
      opts = EnsemblRest.parse_options opts, 'crossreference'
      path = EnsemblRest.build_path "/xrefs/name/#{species}/#{name}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse xrefs_name species, name, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'crossreference'      
    end   


    ##
    # Looks up an external symbol and returns all Ensembl objects linked to it
    def self.xrefs_symbol(species, symbol, opts = {})
      opts = EnsemblRest.parse_options opts, 'crossreference'
      path = EnsemblRest.build_path "/xrefs/symbol/#{species}/#{symbol}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse xrefs_symbol species, symbol, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'crossreference'      
    end  


  end
end