class User < ActiveRecord::Base
  has_many :goods, dependent: :destroy
  has_many :signs, dependent: :destroy
  before_create :create_remember_token
  VALID_USERID_REGEX = /\A\d+\z/
  validates :contact, presence: true
  validates :name, presence: true, uniqueness: true
  validates :userid, presence: true, length: {is: 10}, format: { with: VALID_USERID_REGEX }, uniqueness: true

  has_secure_password
  validates :password, length: {minimum: 6}

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
