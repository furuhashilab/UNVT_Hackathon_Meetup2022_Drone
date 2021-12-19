require './constants'
require 'yaml'
require 'json'

pipeline = <<-EOS
pipeline: 
  - 
    filename: #{SRC_PATH}
    type: readers.las
    spatialreference: "#{SRC_EPSG}"
  -
    type: filters.reprojection
    out_srs: "EPSG:3857"
  -
    type: writers.las
    filename: #{REPROJECTED_PATH}
EOS

print JSON.dump(YAML.load(pipeline))
