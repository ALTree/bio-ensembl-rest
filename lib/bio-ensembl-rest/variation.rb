module EnsemblRest
  module Variation

    ##
    # Fetch variant consequences based on a variation identifier
    def self.vep_id(id, species, opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/vep/#{species}/id/#{id}/consequences", opts

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
      path = EnsemblRest.build_path "/vep/#{species}/#{region}/#{allele}/consequences", opts

      # TODO: ruby object?
      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse vep_region allele, region, species, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'taxonomy'
    end

  end
end