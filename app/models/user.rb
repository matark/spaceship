class User < ActiveRecord::Base
  has_secure_password
  has_secure_token :refresh_token
  has_many :spaces

  validates :name, presence: true, length: { in: 3..32 }
  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP

  def access_token
    @_access_token ||= generate_access_token
  end

  def generate_access_token
    Spaceship::Knock::AuthToken.new({ sub: id }).to_s
  end
end
