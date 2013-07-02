module EnsemblRest
  module Lookup

    # GET lookup/id/:id
    def self.lookup_id(id, opts = {})
      opts = EnsemblRest.parse_options opts, 'lookup'
      path = EnsemblRest.build_path "/lookup/id/#{id}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse lookup_id id, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'lookup' 
    end

  end
end