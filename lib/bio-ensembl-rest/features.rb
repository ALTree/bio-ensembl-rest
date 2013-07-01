module BioEnsemblRest
  module Features

    # GET feature/id/:id 
    def self.feature_id(id, features, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'feature'

      # features is a required parameter, but we need to encode it into the url
      encoded_query = ""
      features.each {|f| encoded_query << "feature=#{f};"}

      path = (BioEnsemblRest.build_path "/feature/id/#{id}", opts) + encoded_query

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse feature_id id, features, plain_opts
      end

      return BioEnsemblRest.fetch_data path, opts, 'features'   
    end


    # GET feature/region/:species/:region
    def self.feature_region(species, region, features, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'feature'

      # features is a required parameter, but we need to encode it into the url
      encoded_query = ""
      features.each {|f| encoded_query << "feature=#{f};"}

      path = (BioEnsemblRest.build_path "/feature/region/#{species}/#{region}", opts) + encoded_query

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse feature_region species, region, features, plain_opts
      end

      return BioEnsemblRest.fetch_data path, opts, 'features'   
    end

  end
end