require './constants'
require 'yaml'
require 'json'

pipeline = <<-EOS
pipeline: 
  - 
    filename: #{SRC_URL.split('/')[-1]}
    type: readers.las
    spatialreference: "#{SRC_EPSG}"
  -
    type: filters.reprojection
    out_srs: "EPSG:3857"
  -
    type: writers.las
    filename: #{PROJECTED_PATH}
EOS

print JSON.dump(YAML.load(pipeline))
