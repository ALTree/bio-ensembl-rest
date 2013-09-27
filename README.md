Ensembl Rest
================

A Ruby library for the RESTful Ensembl API.

[![Gem Version](https://badge.fury.io/rb/bio-ensembl-rest.png)](http://badge.fury.io/rb/bio-ensembl-rest)

Obtaining
---------

```sh
gem install bio-ensembl-rest
```
for the repository:
```sh
git clone git://github.com/ALTree/bio-ensembl-rest
```

Usage
-----

Each of the endpoint group listed in the Ensembl REST [documentation](http://beta.rest.ensembl.org/) has its own ruby module with the same name (except for Ontologies and Taxonomy, wich is split in two modules).

**A full list of modules and methods, with documentation, is available [here](https://github.com/ALTree/bio-ensembl-rest/wiki/modules-and-methods-list)**.

To make a request to an endpoint, use the appropriate method in the relative module. For example, to access the `sequence/region/:species/:region ` endpoint in the Sequence group, use the `sequence_region` method in the `Sequence` module:

```ruby
require 'bio-ensembl-rest'
include EnsemblRest

EnsemblRest.connect_db # connect to database
puts Sequence.sequence_region 'Homo sapiens', 'X:1000000..1000025:1'

# GAAACAGCTACTTGGAAGGCTGAAGC
```

Documentation
-----------
See the [ensembl-rest wiki page](https://github.com/ALTree/bio-ensembl-rest/wiki).

## Known issues

### version-specific issues

* On jruby, methods in the ComparativeGenomics module fail if called with `response: ruby`,
due to a C dependency in the 'bio' gem.

* On rubinius, methods in the ComparativeGenomics module fail if called with `response: ruby`,
due to a C dependency in the 'bio' gem.

