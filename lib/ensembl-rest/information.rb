module EnsemblRest
  module Information

    ##
    # Returns information about the current available assemblies in this given species
    def self.assembly_info(species, opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/assembly/info/#{species}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse assembly_info species, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'information'  
    end


    ##
    # Returns information about the given toplevel sequence region given to this endpoint
    def self.assembly_info_region(species, region, opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/assembly/info/#{species}/#{region}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse assembly_info_region species, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'information'        
    end


    ##
    # Lists all available comparative genomics databases and their data release
    def self.info_comparas(opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/info/comparas", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_comparas plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'information'      
    end


    ##
    # Shows the data releases available on this REST server
    def self.info_data(opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/info/data", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_data plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'information'      
    end   


    ##
    # Pings the first available DBAdaptor to see if the service is still active
    def self.info_ping(opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/info/ping", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_ping plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'information' 
    end


    ##
    # Shows the current version of the REST API
     def self.info_rest(opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/info/rest", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_rest plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'information' 
    end   


    ##
    # Shows the current version of the Ensembl API
     def self.info_software(opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/info/software", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_software plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'information' 
    end  


    ##
    # Lists all available species, their aliases, available adaptor groups and data release
     def self.info_species(opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/info/species", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_species plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'information' 
    end 


  end
end
