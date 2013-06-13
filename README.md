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

## Sequence

### Sequence.sequence_id 

Query for multiple types of Sequence by its Ensembl stable identifier.

Parameters (required in **bold**)
  * **id** 
  * format: [fasta|json|text|yaml|xml|ruby]
  * type: [genomic|cds|cdna|protein]
  * expand_up
  * expand_down
  * mask: [soft|hard]
  * multiseq: [true|false]

Examples:

```ruby
>> Sequence.sequence_id 'ENSG00000228985' # plain and simple query by ID
```

```ruby
>> Sequence.sequence_id 'ENSG00000157764', 
      format: 'fasta', # return format: fasta
      multiseq: true, # allow for multiple sequences to be returned
      type: 'protein' # the type of sequence to retrieve
```

```ruby
>> Sequence.sequence_id 'ENSE00001154485',
      format: 'text',
      type: 'genomic',
      expand_up: 10  # Expand the sequence upstream by this many basepairs
```

### Sequence.sequence_region

...
        
## Project home page

Information on the source tree, documentation, examples, issues and
how to contribute, see

  http://github.com/ALTree/bioruby-ensembl-rest


Copyright (c) 2013 Alberto Donizetti. See LICENSE.txt for further details.