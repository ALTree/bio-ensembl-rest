module EnsemblRest
  module CrossReference

    # GET xrefs/id/:id 
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


    # GET xrefs/name/:species/:name 
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


    # GET xrefs/symbol/:species/:symbol
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