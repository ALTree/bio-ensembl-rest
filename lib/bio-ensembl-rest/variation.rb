module BioEnsemblRest
  module Variation

    # GET vep/:species/id/:id/consequences
    def self.vep_id(id, species, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'variation'
      path = BioEnsemblRest.build_path "/vep/#{species}/id/#{id}/consequences", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse vep_id id, species, plain_opts
      end

      return BioEnsemblRest.fetch_data path, opts, 'variation'
    end


    # GET vep/:species/:region/:allele/consequences
    def self.vep_region(allele, region, species, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'variation'
      path = BioEnsemblRest.build_path "/vep/#{species}/#{region}/#{allele}/consequences", opts

      # TODO: ruby object?
      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse vep_region allele, region, species, plain_opts
      end

      return BioEnsemblRest.fetch_data path, opts, 'taxonomy'
    end

  end
end