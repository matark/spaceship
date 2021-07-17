require 'bundler/setup'
require 'dotenv/load'
require 'spaceship'
require 'spaceship/setup'

Spaceship::Knock.configure do |config|
  config.secret = ENV['JWT_SECRET']
end
