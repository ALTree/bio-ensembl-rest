module BioEnsemblRest

  ## start HTTP database connection ##

  def self.connect_db 
    $SERVER = URI.parse 'http://beta.rest.ensembl.org'
    $HTTP_CONNECTION = Net::HTTP.new($SERVER.host, $SERVER.port)
  end


  ## parse options stuff ##

  def self.parse_options(opts)
    parsed_opts = {}
    opts.each {|k, v| parsed_opts[k.to_s] = v}

    parse_format parsed_opts
    parse_expand parsed_opts
    parse_multiseq parsed_opts
    parse_coords parsed_opts

    parsed_opts
  end

  def self.parse_format(opts)
    supported_formats = {
      'fasta' => 'text/x-fasta',
      'json' => 'application/json',
      'text' => 'text/plain',
      'yaml' => 'text/x-yaml',
      'xml' => 'text/x-seqxml+xml' }
    if opts['format']
      if supported_formats[opts['format']]
        opts['content-type'] = supported_formats[opts['format']]
      else
        opts['content-type'] = opts['format']
      end
      opts.delete 'format'
    end
    opts
  end

  def self.parse_expand(opts)
    if opts['expand_down'] 
      opts['expand_3prime'] = opts['expand_down'] 
      opts.delete 'expand_down'
    end
    if opts['expand_up'] 
      opts['expand_5prime'] = opts['expand_up'] 
      opts.delete 'expand_up'
    end
  end

  def self.parse_multiseq(opts)
    if opts['multiseq'] 
      opts['multiple_sequences'] = opts['multiseq'] ? '1' : '0'
      opts.delete 'multiseq'
    end
  end

  def self.parse_coords(opts)
    if opts['coords']
      opts['coord_system'] = opts['coords']
      opts.delete 'coords'
    end
  end


  ## HTTP request stuff ##

  def self.build_path(home, opts)
    path = home + '?'
    opts.each { |k,v| path << "#{k}=#{v};"  if k != 'content-type' }
    path[-1] = ''
    path
  end

  def self.fetch_data(path, opts)
    request = Net::HTTP::Get.new path
    request.content_type = opts['content-type'] || 'text/plain'
    response = $HTTP_CONNECTION.request request # ask for data
    return check_response response
  end

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


end
