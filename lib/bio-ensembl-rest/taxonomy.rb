module EnsemblRest
  module Taxonomy

    # GET taxonomy/id/:id
    def self.taxonomy_id(id, opts = {})
      return _taxonomy_generic id, 'id', opts
    end

    # GET taxonomy/classification/:id
    def self.taxonomy_classification(id, opts = {})
      return _taxonomy_generic id, 'classification', opts
    end

    def self._taxonomy_generic(id, type, opts = {})
      opts = EnsemblRest.parse_options opts, 'taxonomy'
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