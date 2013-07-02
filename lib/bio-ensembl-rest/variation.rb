module EnsemblRest
  module Variation

    # GET vep/:species/id/:id/consequences
    def self.vep_id(id, species, opts = {})
      opts = EnsemblRest.parse_options opts, 'variation'
      path = EnsemblRest.build_path "/vep/#{species}/id/#{id}/consequences", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse vep_id id, species, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'variation'
    end


    # GET vep/:species/:region/:allele/consequences
    def self.vep_region(allele, region, species, opts = {})
      opts = EnsemblRest.parse_options opts, 'variation'
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