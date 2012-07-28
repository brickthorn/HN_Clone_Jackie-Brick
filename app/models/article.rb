class Article < ActiveRecord::Base
  attr_accessible :title, :url, :owner_id, :comments

  validates_presence_of :title, :url
  validates_uniqueness_of :url

  belongs_to :owner, :class_name => "User"
  has_many :votes, :as => :posting
  has_many :comments, :foreign_key => :posting_id
  # has_many :commments

  def recent?
    self.created_at > (Time.zone.now - 900)
  end

end
