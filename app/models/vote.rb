class Vote < ActiveRecord::Base
  attr_accessible :user_id, :posting, :value

  belongs_to :user
  belongs_to :posting, :polymorphic => true
end
