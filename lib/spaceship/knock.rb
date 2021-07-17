require 'jwt'
require 'active_support/configurable'
require 'active_support/core_ext/numeric/time'
require 'spaceship/knock/auth_token'
require 'spaceship/knock/authenticable'

module Spaceship
  module Knock
    include ActiveSupport::Configurable
  end
end
