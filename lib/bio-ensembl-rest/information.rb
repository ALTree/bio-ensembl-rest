module BioEnsemblRest
  module Information

    # GET assembly/info/:species
    def self.assembly_info(species, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'information'
      path = BioEnsemblRest.build_path "/assembly/info/#{species}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse assembly_info species, plain_opts
      end

      return BioEnsemblRest.fetch_data path, opts, 'information'  
    end


    # GET assembly/info/:species/:region_name
    def self.assembly_info_region(species, region, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'information'
      path = BioEnsemblRest.build_path "/assembly/info/#{species}/#{region}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse assembly_info_region species, plain_opts
      end

      return BioEnsemblRest.fetch_data path, opts, 'information'        
    end


    # GET info/comparas
    def self.info_comparas(opts = {})
      opts = BioEnsemblRest.parse_options opts, 'information'
      path = BioEnsemblRest.build_path "/info/comparas", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_comparas plain_opts
      end

      return BioEnsemblRest.fetch_data path, opts, 'information'      
    end


    # GET info/data
     def self.info_data(opts = {})
      opts = BioEnsemblRest.parse_options opts, 'information'
      path = BioEnsemblRest.build_path "/info/comparas", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_data plain_opts
      end

      return BioEnsemblRest.fetch_data path, opts, 'information'      
    end   


    # GET info/ping
    def self.info_ping(opts = {})
      opts = BioEnsemblRest.parse_options opts, 'information'
      path = BioEnsemblRest.build_path "/info/comparas", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_ping plain_opts
      end

      return BioEnsemblRest.fetch_data path, opts, 'information' 
    end


    # GET info/rest
     def self.info_rest(opts = {})
      opts = BioEnsemblRest.parse_options opts, 'information'
      path = BioEnsemblRest.build_path "/info/comparas", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_rest plain_opts
      end

      return BioEnsemblRest.fetch_data path, opts, 'information' 
    end   


    # GET info/software
     def self.info_software(opts = {})
      opts = BioEnsemblRest.parse_options opts, 'information'
      path = BioEnsemblRest.build_path "/info/comparas", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_software plain_opts
      end

      return BioEnsemblRest.fetch_data path, opts, 'information' 
    end  


    # GET info/species 
     def self.info_species(opts = {})
      opts = BioEnsemblRest.parse_options opts, 'information'
      path = BioEnsemblRest.build_path "/info/comparas", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse info_species plain_opts
      end

      return BioEnsemblRest.fetch_data path, opts, 'information' 
    end 



  end
end