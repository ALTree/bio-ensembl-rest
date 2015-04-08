module EnsemblRest
  module Variation

    ##
    # Fetch variant consequences based on a variation identifier
    def self.vep_id(id, species, opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/vep/#{species}/id/#{id}", opts 
      ### removed /consequences 

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse vep_id id, species, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'variation'
    end


    ##
    # Fetch variant consequences
    def self.vep_region(allele, region, species, opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/vep/#{species}/region/#{region}/#{allele}", opts 
      ### old endpoint /vep/#{species}/#{region}/#{allele}

      # TODO: ruby object?
      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse vep_region allele, region, species, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'variation'
      ### 'taxonomy' changed in 'variation'
    end

    # Fetch variant consequences based on a HGVS notation
    def self.vep_hgvs(species, hgvs, opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/vep/#{species}/hgvs/#{hgvs}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse vep_id id, species, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'variation'
    end

   ##
   # Uses a variation identifier (e.g. rsID) to return the variation features
    def self.variation_id(species, id, opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/variation/#{species}/#{id}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse vep_id id, species, plain_opts
      end

    return EnsemblRest.fetch_data path, opts, 'variation'
    end
  end
end
