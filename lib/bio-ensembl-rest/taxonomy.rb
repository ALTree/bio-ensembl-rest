module EnsemblRest
  module Taxonomy

    ##
    # Search for a taxonomic term by its identifier or name
    def self.taxonomy_id(id, opts = {})
      return _taxonomy_generic id, 'id', opts
    end

    ##
    # Return the taxonomic classification of a taxon node
    def self.taxonomy_classification(id, opts = {})
      return _taxonomy_generic id, 'classification', opts
    end

    # Search for a taxonomic id by a non-scientific name
    def self.taxonomy_name(name, opts = {})
      return _taxonomy_generic name, 'name', opts
    end

    def self._taxonomy_generic(id, type, opts = {}) # :nodoc:
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/taxonomy/#{type}/#{id}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse _taxonomy_generic id, type, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'taxonomy'
    end

  end
end
