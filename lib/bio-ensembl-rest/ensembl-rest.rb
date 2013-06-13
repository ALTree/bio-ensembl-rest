module BioEnsemblRest

  ## self-explained
  def self.connect_db 
    $SERVER = URI.parse 'http://beta.rest.ensembl.org'
    $HTTP_CONNECTION = Net::HTTP.new($SERVER.host, $SERVER.port)
  end


  ## check HTTP response
  def self.check_response(response)
  case response.code
  when '200'
    return response.body
  when '400'
    raise 'Bad request: ' + response.body
  when '404' 
    raise 'Not Found'
  when '429' 
    raise 'Too many requests'
  when '503'
    raise 'Service Unavailable'
  else
    raise "Bad response code: #{response.code}"
  end
  end


  ## parse options
  def self.parse_options(opts)
    parsed_opts = {}

    # check keys
    opts.each do |k, v| 
      case k
      when 'format'
        parsed_opts['content-type'] = v
      when 'multiseq'
        parsed_opts['multiple_sequences'] = v ? '1' : '0'
      when 'expand_down'
        parsed_opts['expand_3prime'] = v.to_s
      when 'expand_up'
        parsed_opts['expand_5prime'] = v.to_s
      else
        parsed_opts[k] = v
      end
    end

    # check values
    parsed_opts.each do |k, v|
      case v
      when 'fasta'
        parsed_opts['content-type'] = 'text/x-fasta'
      when 'json'
        parsed_opts['content-type'] = 'application/json'
      when 'text'
        parsed_opts['content-type'] = 'text/plain'
      when 'yaml'
        parsed_opts['content-type'] = 'text/x-yaml'
      when 'xml'
        parsed_opts['content-type'] = 'text/x-seqxml+xml'
      else
        parsed_opts[k] = v
      end
    end

    parsed_opts
  end

end
