Bio Ensembl Rest
================

A Ruby library for the RESTful Ensembl API.

Obtaining
---------

```sh
    gem install bio-ensembl-rest
```

Usage
-----

Example:

```sh
    $ irb
    >> require 'bio-ensembl-rest'
    => true

    >> BioEnsemblRest.connect_db
    => #<Net::HTTP beta.rest.ensembl.org:80 open=false>

    >> BioEnsemblRest::Sequence.sequence_id 'ENSG00000228985'
    => "ACTGGGGGATACG"
```

RoadMap
-----

### Core

 * Comparative Genomics
  * genetree_id ☑
  * genetree_member_id ☑
  * genetree_member_symbol ☑
  * homology_id ☑
  * homology_symbol ☑

 * Cross Reference
  * xrefs_id ☑
  * xrefs_name ☑
  * xrefs_species ☑

 * Features
  * feature_id ☑
  * feature_region ☑

 * Information
  * assembly_info ☑
  * assembly_info_region ☑
  * info_comparas ☑
  * info_data ☑
  * info_ping ☑
  * info_rest ☑
  * info_software ☑
  * info_species ☑

 * Lookup
  * lookup_id

 * Mapping
  * map 
  * map_from_cdna
  * map_from_cds
  * map_from_translation

 * Ontologies and Taxonomy
  * ontology_ancestors
  * ontology_ancestors_chart 
  * ontology_descendents
  * ontology_id
  * ontology_name 
  * taxonomy_classifications
  * taxonomy_id

 * Sequences
  * sequence_id ☑
  * sequence_region ☑

 * Variation
  * vep_region
  * vep_id

### Tests

 * Comparative Genomics ☑
 * Cross Reference ☑
 * Features ☑
 * Information ☑
 * Lookup
 * Mapping
 * Ontologies and Taxonomy
 * Sequences ☑
 * Variation

### Documentation

 * Comparative Genomics
 * Cross Reference
 * Features
 * Information
 * Lookup
 * Mapping
 * Ontologies and Taxonomy
 * Sequences
 * Variation

  
## Project home page

Information on the source tree, documentation, examples, issues and
how to contribute, see

  http://github.com/ALTree/bioruby-ensembl-rest


Copyright (c) 2013 Alberto Donizetti. See LICENSE.txt for further details.
