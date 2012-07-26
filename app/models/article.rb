class Article < ActiveRecord::Base
  attr_accessible :title, :url, :owner_id

  validates_presence_of :title, :url
  validates_uniqueness_of :url

  belongs_to :owner, :class_name => "User"

  def recent?
    self.created_at > (Time.zone.now - 900)
  end

end
