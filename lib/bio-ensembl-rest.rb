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
require 'open-uri'

Dir[File.dirname(__FILE__) + '/bio-ensembl-rest/*.rb'].each do |file| 
  require file
end

