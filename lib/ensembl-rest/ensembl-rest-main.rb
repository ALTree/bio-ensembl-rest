module EnsemblRest 
  ## start HTTP database connection ##

  def self.connect_db 
    $SERVER = URI.parse 'http://beta.rest.ensembl.org'
    $HTTP_CONNECTION = Net::HTTP.new($SERVER.host, $SERVER.port)
  end


  ## parse options stuff ##
  def self.parse_options(opts) # :nodoc:
    parsed_opts = {}
    opts.each {|k, v| parsed_opts[k.to_s] = v}

    parse_format parsed_opts
    parse_true_false parsed_opts
  end

  def self.parse_true_false(opts) # :nodoc:
    opts.each do |k, v|
      if v.instance_of?(TrueClass)
        opts[k] = 1
      elsif v.instance_of?(FalseClass)
        opts[k] = 0
      end
    end
  end

  def self.parse_format(opts) # :nodoc:
    supported_formats = {
      'text' => 'text/plain',
      'fasta' => 'text/x-fasta',
      'gff3' => 'ext/x-gff3',
      'json' => 'application/json',
      'msgpack' => 'application/x-msgpack',
      'nh' => 'text/x-nh',
      'seqxml' => 'text/x-seqxml+xml', 
      'sereal' => 'application/x-sereal',
      'phyloxml' => 'text/x-phyloxml+xml',
      'xml' => 'text/xml',
      'yaml' => 'text/x-yaml'
    }
    if opts.has_key?('response')
      req = opts['response']
      if supported_formats[req]
        opts['content-type'] = supported_formats[req]
      else
        opts['content-type'] = req
      end
      opts.delete 'response'
    end
    opts
  end


  ## HTTP request stuff ##

  def self.build_path(home, opts) # :nodoc:
    path = home + '?'
    opts.each { |k,v| path << "#{k}=#{v};"  if k != 'content-type' }
    path[-1] = '' if not opts
    URI::encode path
  end

  def self.fetch_data(path, opts, mod) # :nodoc:
    # what we should set as content-type in the header
    # to keep ensembl happy when the the user does not
    # use the format parameter to set the return type
    default_types = {
      'sequence' => 'text/plain',
      'compara' => 'text/xml',
      'crossreference' => 'application/json',
      'features' => 'application/json',
      'information' => 'text/plain',
      'lookup' => 'application/json',
      'mapping' => 'application/json',
      'ontologies' => 'application/json',
      'taxonomy' => 'application/json',
      'variation' => 'application/json'
    }
    request = Net::HTTP::Get.new path
    request.content_type = opts['content-type'] || default_types[mod]
    response = $HTTP_CONNECTION.request request
    return check_response response
  end

  def self.check_response(response) # :nodoc:
    case response.code 
    when '200'
      return response.body
    when '400'
      raise 'Bad request: ' + response.body
    when '404' 
      raise 'Not Found'
    when '415'
      raise 'Unsupported Media Type'
    when '429' 
      raise 'Too many requests'
    when '503'
      raise 'Service Unavailable'
    else
      raise "Bad response code: #{response.code}"
    end
  end


end
