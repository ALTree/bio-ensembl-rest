module BioEnsemblRest
  module Mapping

    # GET map/:species/:asm_one/:region/:asm_two
    def self.map(asm_one, asm_two, species, region, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'mapping'
      path = BioEnsemblRest.build_path "/map/#{species}/#{asm_one}/#{region}/#{asm_two}", opts

      # TODO: ruby object?
      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse map asm_one, asm_two, species, region, plain_opts
      end

      return BioEnsemblRest.fetch_data path, opts, 'mapping' 
    end


    # GET map/cdna/:id/:region
    def self.map_from_cdna(id, region, opts = {})
      return _map_generic id, region, 'cdna', opts       
    end


    # GET map/cds/:id/:region
    def self.map_from_cds(id, region, opts = {})
      return _map_generic id, region, 'cds', opts
    end

    # GET map/translation/:id/:region
    def self.map_from_region(id, region, opts = {})
      return _map_generic id, region, 'translation', opts
    end


    # generic mapping form cdna and cds
    def self._map_generic(id, region, type, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'mapping'
      path = BioEnsemblRest.build_path "/map/#{type}/#{id}/#{region}", opts

      # TODO: ruby object?
      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse _map_generic id, region, type, plain_opts
      end

      return BioEnsemblRest.fetch_data path, opts, 'mapping'

    end



  end
end