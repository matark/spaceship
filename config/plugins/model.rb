module Spaceship
  module Plugins
    module Model
      extend ActiveSupport::Concern

      included do
        register Sinatra::ActiveRecordExtension
      end
    end
  end
end
