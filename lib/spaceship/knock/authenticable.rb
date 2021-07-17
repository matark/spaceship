module Spaceship
  module Knock
    module Authenticable
      private

      def authenticate_user
        @payload = AuthToken.decode(auth_token).first
      rescue JWT::DecodeError
        halt 401
      end

      def current_user
        @_current_user ||= User.find(@payload['sub'])
      end

      def auth_token
        token_from_request_headers || params[:token]
      end

      def token_from_request_headers
        request.get_header('HTTP_AUTHORIZATION')&.split&.last
      end
    end
  end
end
