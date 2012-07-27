class Vote < ActiveRecord::Base
  attr_accessible :user_id, :posting, :value

  belongs_to :user
  belongs_to :posting, :polymorphic => true

  after_save :update_vote_counter


  def update_vote_counter
    posting.vote_count ||= 0
    posting.vote_count += 1
    posting.save
  end


end
