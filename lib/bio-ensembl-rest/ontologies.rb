module BioEnsemblRest
  module Ontologies

    # GET ontology/ancestors/:id
    def self.ontology_ancestor(id, opts = {})
      return _ontology_id_generic id, 'ancestors_plain', opts
    end


    # GET ontology/ancestors/chart/:id
    def self.ontology_ancestor_chart(id, opts = {})
      return _ontology_id_generic id, 'ancestors_chart', opts
    end 

    # GET ontology/descendents/:id
    def self.ontology_descendents(id, opts = {})
      return _ontology_id_generic id, 'descendents', opts
    end

    # GET ontology/id/:id 
    def self.ontology_id(id, opts = {})
      return _ontology_id_generic id, 'plain', opts
    end

    def self._ontology_id_generic(id, type, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'ontologies'
      case type 
      when 'ancestors_plain'
        url = "/ontology/ancestors/#{id}"
      when 'ancestors_chart'
        url = "/ontology/ancestors/chart/#{id}"
      when 'descendents'
        url = "/ontology/descendents/#{id}"
      when 'plain'
        url = "/ontology/id/#{id}"
      end
      path = BioEnsemblRest.build_path url, opts

      # TODO: ruby object?
      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse _ontology_id_generic id, type, plain_opts
      end

      return BioEnsemblRest.fetch_data path, opts, 'ontologies'
    end


    # GET ontology/name/:name
    def self.ontology_name(name, opts = {})
      opts = BioEnsemblRest.parse_options opts, 'ontologies'
      path = BioEnsemblRest.build_path "/ontology/name/#{name}", opts
      
      # TODO: ruby object?
      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse ontology_name name, plain_opts
      end

      return BioEnsemblRest.fetch_data path, opts, 'ontologies'
    end

  end
end