class Article < ActiveRecord::Base
  attr_accessible :title, :url, :owner_id

  validates_presence_of :title, :url
  validates_uniqueness_of :url

  belongs_to :user
end
