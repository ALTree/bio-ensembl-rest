Bio Ensembl Rest
================

A Ruby library for the RESTful Ensembl API.

# bio-ensembl-rest

[![Build Status](https://secure.travis-ci.org/ALTree/bioruby-ensembl-rest.png)](http://travis-ci.org/ALTree/bioruby-ensembl-rest)


Obtaining
---------

```sh
    gem install bio-ensembl-rest
```

Usage
-----

TODO

## Sequence

### Sequence.sequence_id 

Query for multiple types of Sequence by its stable identifier.

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


```


        
## Project home page

Information on the source tree, documentation, examples, issues and
how to contribute, see

  http://github.com/ALTree/bioruby-ensembl-rest


Copyright (c) 2013 Alberto Donizetti. See LICENSE.txt for further details.

