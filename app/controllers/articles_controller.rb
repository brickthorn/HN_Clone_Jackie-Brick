class ArticlesController < ApplicationController

  def index

  end

  def new
    @article = Article.new
  end


  def create
    url = params[:article][:url]
    url = "http://" + url if !url.include?("http://") if url != ""
    @article = Article.new(:title => params[:article][:title], :url => url)
    if @article.save
      redirect_to articles_path
    else
      render "new"
    end
    # @article.save ? redirect_to(articles_path) : render "new"
  end


  def show
  end


end
