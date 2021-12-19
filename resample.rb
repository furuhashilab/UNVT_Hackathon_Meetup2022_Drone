require './constants'
require 'yaml'
require 'json'

z = ENV['Z'].to_i
spacing = (BASE ** (Z_ONE_METER - z)).to_f
$stderr.print "#{spacing}m from #{SRC_PATH}\n"

pipeline = <<-EOS
pipeline: 
  - 
    filename: #{REPROJECTED_PATH}
    type: readers.las
  -
    type: filters.voxelcenternearestneighbor
    cell: #{spacing}
  -
    type: writers.text
    format: csv
    filename: STDOUT
EOS

print JSON.dump(YAML.load(pipeline))
