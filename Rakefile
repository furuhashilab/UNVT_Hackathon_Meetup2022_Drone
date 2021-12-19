require './constants'

desc 'reproject the las file'
task :reproject do
  sh "ruby reproject.rb | pdal pipeline --stdin"
end

