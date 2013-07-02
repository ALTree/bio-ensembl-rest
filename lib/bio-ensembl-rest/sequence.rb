module EnsemblRest
  module Sequence

    ##
    # Query for multiple types of Sequence by its stable identifier
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


    ##
    # Query for a region of genomic sequence based on its location
    def self.sequence_region(species, region, opts = {})
      opts = EnsemblRest.parse_options opts, 'sequence'
      path = EnsemblRest.build_path "/sequence/region/#{species}/#{region}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'text/plain'
        return Bio::Sequence.auto sequence_region(species, region, plain_opts)
      end

      return EnsemblRest.fetch_data path, opts,  'sequence'
    end

  end
end
