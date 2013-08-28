module EnsemblRest
  module Features

    ##
    # Uses the given identifier as a way of indicating the Slice of features required
    def self.feature_id(id, features, opts = {})
      opts = EnsemblRest.parse_options opts

      # features is a required parameter, but we need to encode it into the url
      encoded_query = ""
      features.each {|f| encoded_query << "feature=#{f};"}

      path = (EnsemblRest.build_path "/feature/id/#{id}", opts) + encoded_query

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse feature_id id, features, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'features'   
    end


    ##
    # Retrieves multiple types of features for a given region
    def self.feature_region(species, region, features, opts = {})
      opts = EnsemblRest.parse_options opts

      # features is a required parameter, but we need to encode it into the url
      encoded_query = ""
      features.each {|f| encoded_query << "feature=#{f};"}

      path = (EnsemblRest.build_path "/feature/region/#{species}/#{region}", opts) + encoded_query

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse feature_region species, region, features, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'features'   
    end

  end
end