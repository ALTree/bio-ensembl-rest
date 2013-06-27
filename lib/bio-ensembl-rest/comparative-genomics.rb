module BioEnsemblRest
  module ComparativeGenomics

    # GET genetree/id/:id 
    def self.genetree_id(id, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'comparative'
      path = BioEnsemblRest.build_path "/genetree/id/#{id}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'text/x-phyloxml+xml'
        return Bio::PhyloXML::Parser.new genetree_id(id, plain_opts)
      end

      return BioEnsemblRest.fetch_data path, opts, 'compara'
    end

    # GET genetree/member/id/:id 
    def self.genetree_member_id(id, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'comparative'
      path = BioEnsemblRest.build_path "/genetree/member/id/#{id}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'text/x-phyloxml+xml'
        return Bio::PhyloXML::Parser.new genetree_member_id(id,  plain_opts)
      end

      return BioEnsemblRest.fetch_data path, opts, 'compara'

    end

    # GET genetree/member/symbol/:species/:symbol 
    def self.genetree_member_symbol(species, symbol, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'comparative'
      path = BioEnsemblRest.build_path "/genetree/member/symbol/#{species}/#{symbol}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'text/x-phyloxml+xml'
        return Bio::PhyloXML::Parser.new genetree_member_symbol(species, symbol, plain_opts)
      end

      return BioEnsemblRest.fetch_data path, opts, 'compara'

    end


    # GET homology/id/:id 
    def self.homology_id(id, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'comparative'
      path = BioEnsemblRest.build_path "/homology/id/#{id}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        data = JSON.parse ComparativeGenomics.homology_id id, plain_opts
        return build_homology_class data
      end

      return BioEnsemblRest.fetch_data path, opts, 'compara'
    end


    # GET homology/symbol/:species/:symbol 
    def self.homology_symbol(species, symbol, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'comparative'
      path = BioEnsemblRest.build_path "/homology/symbol/#{species}/#{symbol}", opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        data = JSON.parse ComparativeGenomics.homology_symbol species, symbol, plain_opts
        return build_homology_class data
      end

      return BioEnsemblRest.fetch_data path, opts, 'compara'      

    end

    # here we define the Homology class
    Object.const_set("Homology", Class.new)

    def self.build_homology_class(json_data)
      # extract the homologies list (homology = ruby hash obj)
      homologies_data = json_data['data'][0]['homologies'] # this is a list of hashes

      # retrieve homology keys to make a list of methods
      homology_methods = []
      homologies_data.first.each { |k, _| homology_methods << k.to_sym }

      # we define an attr_accessor for each symbol in homology_methods
      # and a 'bio_methods' attribute with all the newly defined methods
      homology_methods.each { |k, _| Homology.class_eval "attr_accessor :#{k}" }
      Homology.class_eval "attr_accessor :bio_methods" 

      # we will return a list of homology objects
      homologies = []

      # let's build the list
      homologies_data.each do |hom| # cycle over the homologies we were given
        h = Homology.new            # we instantiate an Homology obj
        hom.each do |k, v|          # for each key,value in the homology hash
          h.send "#{k}=".to_sym, v  # we use the 'key=' method to set 'value'
        end
        h.send :bio_methods=, homology_methods  # set the bio_methods param
        homologies << h             # add the obj to the list to be returned             
      end

      return homologies
    end


  end
end