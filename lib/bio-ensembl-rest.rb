# Please require your code below, respecting the naming conventions in the
# bioruby directory tree.
#
# For example, say you have a plugin named bio-plugin, the only uncommented
# line in this file would be 
#
#   require 'bio/bio-plugin/plugin'
#
# In this file only require other files. Avoid other source code.

require 'net/http'
require 'bio'

require_relative 'bio-ensembl-rest/sequence.rb'
require_relative 'bio-ensembl-rest/ensembl-rest.rb'

# perché non va?
# Dir.glob('bio-ensembl-rest/*.rb').each do |f|
#   require_relative f
# end


