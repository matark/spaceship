module Spaceship
  module Plugins
    module Resource
      extend ActiveSupport::Concern

      included do
        mime_type :json, 'application/json; charset=utf-8'
      end

      private

      def json(resource, options={})
        super ActiveModelSerializers::SerializableResource.new(resource, options)
      end
    end
  end
end
