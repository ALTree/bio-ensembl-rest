module EnsemblRest
  module Ontologies

    ##
    # Find all ancestors, all terms above, belonging to a given term
    def self.ontology_ancestor(id, opts = {})
      return _ontology_id_generic id, 'ancestors_plain', opts
    end

    ##
    # Reconstruct the entire ancestory of a term from is_a and part_of relationships.
    def self.ontology_ancestor_chart(id, opts = {})
      return _ontology_id_generic id, 'ancestors_chart', opts
    end 

    ##
    # Find all descendents, all terms below, belonging to a given term. 
    def self.ontology_descendents(id, opts = {})
      return _ontology_id_generic id, 'descendents', opts
    end

    ##
    # Search for an ontological term by its namespaced identifier
    def self.ontology_id(id, opts = {})
      return _ontology_id_generic id, 'plain', opts
    end

    def self._ontology_id_generic(id, type, opts = {}) # :nodoc:
      opts = EnsemblRest.parse_options opts
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
      path = EnsemblRest.build_path url, opts

      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse _ontology_id_generic id, type, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'ontologies'
    end


    ##
    # Search for a list of ontological terms by their name and an optional ontology
    def self.ontology_name(name, opts = {})
      opts = EnsemblRest.parse_options opts
      path = EnsemblRest.build_path "/ontology/name/#{name}", opts
      
      if opts['content-type'] == 'ruby'
        plain_opts = opts.clone
        plain_opts['content-type'] = 'application/json'
        return JSON.parse ontology_name name, plain_opts
      end

      return EnsemblRest.fetch_data path, opts, 'ontologies'
    end

  end
end