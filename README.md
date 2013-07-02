Bio Ensembl Rest
================

A Ruby library for the RESTful Ensembl API.

Obtaining
---------

```sh
gem install bio-ensembl-rest
```
or
```sh
git clone git://github.com/ALTree/bio-ensembl-rest

```

Usage
-----

Each of the endpoint groups listed in the Ensembl REST [documentation](http://beta.rest.ensembl.org/) has its own ruby module with the same name (except for Ontologies and Taxonomy, wich is split in two modules).

To make a request to an endpoint, use the appropriate method in the relative module; a full list of modules and methods is [here](https://github.com/ALTree/bio-ensembl-rest/wiki/modules-and-methods-list). For example, to access the `sequence/region/:species/:region ` endpoint in the Sequence group, use the `sequence_region` method in the `Sequence` module:

```ruby
require 'bio-ensembl-rest'
include EnsemblRest

EnsemblRest.connect_db # connect to database
puts Sequence.sequence_region 'Homo sapiens', 'X:1000000..1000025:1'

# GAAACAGCTACTTGGAAGGCTGAAGC
```

Guide
-----------
[WIki page of the library](https://github.com/ALTree/bio-ensembl-rest/wiki)

## Project home page

Information on the source tree, documentation, examples, issues and
how to contribute, see

  http://github.com/ALTree/bioruby-ensembl-rest


Copyright (c) 2013 Alberto Donizetti. See LICENSE.txt for further details.
