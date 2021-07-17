require 'zeitwerk'

Zeitwerk::Loader.new.tap do |loader|
  loader.push_dir('app/controllers')
  loader.push_dir('app/serializers')
  loader.push_dir('app/models')
  loader.setup
end
