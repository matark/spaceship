require_relative 'setup'
require_relative 'frameworks'
require_relative 'plugins/model'
require_relative 'plugins/resource'

module Spaceship
  class Application < Sinatra::Base
    include Knock::Authenticable
    include Plugins::Resource
    include Plugins::Model

    configure :development do
      register Sinatra::Reloader
    end

    get '/user' do
      authenticate_user
      json current_user
    end

    get '/spaces' do
      json Space.take(5)
    end

    get '/spaces/:id' do
      env['rack.request.query_hash'].merge!(params)
      SpacesController.action(:show).call(env)
    end
  end

  def self.application
    @application ||= Rack::Builder.new do
      use Rack::Static
      use Rack::Lock
      use Rack::Head
      use Rack::ETag
      use Rack::Deflater
      run Application
    end
  end
end
