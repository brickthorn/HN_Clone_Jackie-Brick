class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password
      user
    else
      nil
    end
  end

  before_save { |user| user.email = email.downcase }

  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }
  validates_presence_of :email, :name, :password
  # validates_uniqueness_of :email

  #
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  #
end
