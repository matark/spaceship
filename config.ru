$:.unshift File.expand_path('../lib', __FILE__)
require_relative 'config/application'

run Spaceship.application
