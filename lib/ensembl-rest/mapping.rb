module EnsemblRest
  module Mapping

    ##
    # Convert the co-ordinates of one assembly to another
    def self.map(asm_one, asm_two, species, region, opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/map/#{species}/#{asm_one}/#{region}/#{asm_two}", opts

      # TODO: ruby object?
      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse map asm_one, asm_two, species, region, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'mapping' 
    end


    ##
    # Convert from CDNA coordinates to genomic coordinates
    def self.map_from_cdna(id, region, opts = {})
      return _map_generic id, region, 'cdna', opts       
    end

    ##
    # Convert from CDS coordinates to genomic coordinates
    def self.map_from_cds(id, region, opts = {})
      return _map_generic id, region, 'cds', opts
    end

    ##
    # Convert from protein (translation) coordinates to genomic coordinates
    def self.map_from_translation(id, region, opts = {})
      return _map_generic id, region, 'translation', opts
    end

    # generic mapping from cdna and cds
    def self._map_generic(id, region, type, opts = {}) # :nodoc:
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/map/#{type}/#{id}/#{region}", opts

      # TODO: ruby object?
      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse _map_generic id, region, type, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'mapping'
    end

  end
end