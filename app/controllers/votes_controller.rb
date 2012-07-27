class VotesController < ApplicationController


  # def new
  #   @vote = Vote.new
  # end

  def create
    @article = Article.find(params[:posting_id])    # url passed is format - /article/12/vote
    current_user.votes.create(:posting => @article, :value => 1)
    # vote_count = @article.votes
    # vote.posting.vote_count
    #       @article.vote
    #           @article.vote_count += 1
    flash[:alert] = "Thank you for voting!"
    redirect_to articles_path
  end

end


#/articles/10/vote
#/comments/42/vote