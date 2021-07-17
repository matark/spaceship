module Spaceship
  module Knock
    class AuthToken
      def initialize(payload=nil, ttl=2.hours)
        @secret = Knock.config.secret
        @payload = payload&.merge({
          exp: Time.now.to_i + ttl.to_i,
          iat: Time.now.to_i
        })&.compact
      end

      def decode(_token)
        JWT.decode(_token, @secret, true, { algorithm: 'HS256' })
      end

      def token
        @_token ||= JWT.encode(@payload, @secret, 'HS256')
      end

      def to_s
        token
      end

      def self.decode(token)
        new.decode(token)
      end
    end
  end
end
