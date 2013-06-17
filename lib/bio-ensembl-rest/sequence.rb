module BioEnsemblRest
  module Sequence

    # Sequence
    # GET sequence/id/:id
    def self.sequence_id(id, opts = {}) 
      opts = BioEnsemblRest.parse_options opts
      path = BioEnsemblRest.build_path "/sequence/id/#{id}", opts

      # check if content-type is ruby, pick the suitable Bio object
      # FIXME: if multiseq is true Bio::Sequence can't parse text/plain right
      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'text/plain'
        return Bio::Sequence.auto(sequence_id(id, plain_opts))
      end

      return BioEnsemblRest.fetch_data path, opts
    end


    # Sequence
    # GET sequence/region/:species/:region
    def self.sequence_region(spec, reg, opts = {})
      opts = BioEnsemblRest.parse_options opts
      path = BioEnsemblRest.build_path "/sequence/region/#{spec}/#{reg}", opts

      # check if content-type is ruby, pick the suitable Bio object
      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'text/plain'
        return Bio::Sequence.auto(sequence_region(spec, reg, plain_opts))
      end

      return BioEnsemblRest.fetch_data path, opts
    end


  end
end
