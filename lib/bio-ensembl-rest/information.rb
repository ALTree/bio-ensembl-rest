module EnsemblRest
  module Information

    ##
    # Returns information about the current available assemblies in this given species
    def self.assembly_info(species, opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/info/assembly/#{species}", opts 

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
      path = EnsemblRest.build_path "/info/assembly/#{species}/#{region}", opts 

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse assembly_info_region species, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'information'        
    end


    ## 
    # Lists the available analyses by logic name and the database type those logic names are found in.
    def self.info_analysis(species, opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/info/analysis/#{species}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_analysis species, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'information'  
    end


    ## 
    # Lists all available biotypes for the given species.
    def self.info_biotypes(species, opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/info/biotypes/#{species}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_biotypes species, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'information'  
    end

    ##
    # 
    def self.info_compara_methods(opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/info/compara/methods", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_compara_methods plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'information' 
    end


    ##
    # 
    def self.info_compara_species_sets_method(method, opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/info/compara/species_sets/#{method}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_compara_species_sets_method method, plain_opts
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

    ##
    # List all available external sources for a species
    def self.info_external_dbs(species, opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/info/external_dbs/#{species}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_external_dbs plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'information' 
    end 

  end
end
