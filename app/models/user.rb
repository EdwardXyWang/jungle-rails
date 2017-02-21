class User < ActiveRecord::Base

  has_secure_password

  has_many :orders

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :password, presence: true, length: {minimum: 4}
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, pwd)
    email = email.strip.downcase
    user = User.find_by(email: email)

    if user && user.authenticate(pwd)
      user
    end
  end
end
