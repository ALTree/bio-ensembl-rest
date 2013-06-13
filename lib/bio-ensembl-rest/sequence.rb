module BioEnsemblRest
  module Sequence

    def self.sequence_id(id, args = {}) 
      # parse options
      opts = {}
      args.each {|k, v| opts[k.to_s] = v}
      opts = BioEnsemblRest.parse_options opts
      
      # build path
      path = "/sequence/id/#{id}?"
      opts.each { |k,v| path << "#{k}=#{v};"  if k != 'content-type' }
      path[-1] = ''

      # check if content-type is ruby
      # FIXME: if multiseq is true Bio::Sequence can't parse text/plain right
      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'text/plain'
        return Bio::Sequence.auto(sequence_id(id, plain_opts))
      end

      # set request
      request = Net::HTTP::Get.new path
      request.content_type = opts['content-type'] || 'text/plain'

      # ask for data
      response = $HTTP_CONNECTION.request request

      # check response
      return BioEnsemblRest.check_response response
    end

  end
end
