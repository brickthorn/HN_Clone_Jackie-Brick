class CommentsController < ApplicationController
  def new
  end

  def create
    if params[:article_id]
      @article = Article.find(params[:article_id])
    end

    @comment = Comment.new(params[:comment])
    @comment.posting = @article
    if @comment.save
      redirect_to article_path(@article)
    else
      render "articles/show"
    end
  end

  def destroy
  end
end
