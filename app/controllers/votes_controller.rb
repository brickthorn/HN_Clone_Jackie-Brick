class VotesController < ApplicationController
  #
  # def new
  #   @vote = Vote.new
  #   re
  # end

  def create
    @article = Article.find(params[:posting_id])
    vote = current_user.votes.create(:posting => @article, :value => 1)
    # posting_id = params[:posting_id]  # will need to add the post_type as well   post_type = params[:post_type]  AND up or down vote value
    # vote = Vote.new()
    # vote.user_id = current_user.id
    # vote.posting_id = posting_id
    # vote.posting_type = "Article"
    # vote.value = 1
    # vote.save
    flash[:alert] = "Thank you for voting!"
    redirect_to articles_path
  end

end


#/articles/10/vote
#/comments/42/vote