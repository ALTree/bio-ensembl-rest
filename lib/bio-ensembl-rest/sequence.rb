module EnsemblRest
  module Sequence

    # GET sequence/id/:id 
    def self.sequence_id(id, opts = {}) 
      opts = EnsemblRest.parse_options opts, 'sequence'
      path = EnsemblRest.build_path "/sequence/id/#{id}", opts

      # FIXME: if multiseq is true Bio::Sequence can't parse text/plain right
      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'text/plain'
        return Bio::Sequence.auto(sequence_id(id, plain_opts))
      end

      return EnsemblRest.fetch_data path, opts, 'sequence'
    end


    # GET sequence/region/:species/:region
    def self.sequence_region(spec, reg, opts = {})
      opts = EnsemblRest.parse_options opts, 'sequence'
      path = EnsemblRest.build_path "/sequence/region/#{spec}/#{reg}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'text/plain'
        return Bio::Sequence.auto(sequence_region(spec, reg, plain_opts))
      end

      return EnsemblRest.fetch_data path, opts,  'sequence'
    end

  end
end
