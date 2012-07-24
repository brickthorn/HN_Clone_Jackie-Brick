class User < ActiveRecord::Base
  attr_accessible :email, :name, :password
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password
      user
    else
      nil
    end
  end
  
  validates_presence_of :email, :name, :password
end
