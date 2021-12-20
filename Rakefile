require './constants'

desc 'reproject the las file'
task :reproject do
  sh "ruby reproject.rb | pdal pipeline --stdin"
end

desc 'resample the las file'
task :resample do
  cmd = "("
  MINZOOM.upto(MAXZOOM) {|z|
    cmd += <<-EOS
Z=#{z} ruby resample.rb | pdal pipeline --stdin | Z=#{z} ruby togeojson.rb;
    EOS
  }
  cmd += <<-EOS
) | tippecanoe \
--maximum-zoom=#{MAXZOOM} \
--minimum-zoom=#{MINCOPYZOOM} \
--projection=EPSG:3857 \
--force \
--output-to-directory=#{TILE_DIR} \
--no-tile-compression \
--no-tile-size-limit \
--no-feature-limit
  EOS
  sh cmd
end

desc 'build style'
task :style do
  sh "charites build style/style.yml docs/style.json"
end

desc 'host the site locally'
task :host do
  sh "budo -d docs"
end

