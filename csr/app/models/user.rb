class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :username
  has_secure_password

  validates :username, presence: true, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :password, presence: true, length: { minimum: 6 }

  validates :password_confirmation, presence: true

  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
