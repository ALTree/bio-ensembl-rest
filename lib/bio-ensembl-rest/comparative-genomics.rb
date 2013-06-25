module BioEnsemblRest
  module ComparativeGenomics

    # GET genetree/id
    def self.genetree_id(id, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'comparative'
      path = BioEnsemblRest.build_path "/genetree/id/#{id}", opts

      if opts['content-type'] == 'ruby'
        # TODO: Bio::phyloXML.parse or not?
      end

      return BioEnsemblRest.fetch_data path, opts, 'compara'
    end

    # GET genetree/member/id
    def self.genetree_member_id(id, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'comparative'
      path = BioEnsemblRest.build_path "/genetree/member/id/#{id}", opts

      if opts['content-type'] == 'ruby'
        # TODO: Bio::phyloXML.parse or not?
      end

      return BioEnsemblRest.fetch_data path, opts, 'compara'

    end

    # GET genetree/member/symbol
    def self.genetree_member_symbol(species, symbol, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'comparative'
      path = BioEnsemblRest.build_path "/genetree/member/symbol/#{species}/#{symbol}", opts

      if opts['content-type'] == 'ruby'
        # TODO: Bio::phyloXML.parse or not?
      end

      return BioEnsemblRest.fetch_data path, opts, 'compara'

    end


    # GET homology/id/
    def self.homology_id(id, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'comparative'
      path = BioEnsemblRest.build_path "/homology/id/#{id}", opts

      if opts['content-type'] == 'ruby'
        
      end

      return BioEnsemblRest.fetch_data path, opts, 'compara'

    end


    # GET homology/symbol
    def self.homology_symbol(species, symbol, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'comparative'
      path = BioEnsemblRest.build_path "/homology/symbol/#{species}/#{symbol}", opts

      if opts['content-type'] == 'ruby'
        # TODO: Bio::phyloXML.parse or not?
      end

      return BioEnsemblRest.fetch_data path, opts, 'compara'      

    end


  end
end