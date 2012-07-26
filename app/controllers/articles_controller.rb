class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end


  def create
    url = params[:article][:url]
    @current_user = current_user
    url = "http://" + url if !url.include?("http://") if url != ""
    @article = Article.new(:title => params[:article][:title], :url => url, :owner_id => @current_user.id)
    if @article.save
      redirect_to articles_path
    else
      render "new"
    end
    # @article.save ? redirect_to(articles_path) : render "new"
  end


  def show
  end


  def edit
    @article = Article.find(params[:id])
    # if the article
  end


  def update
    @article = Article.find(params[:id])
    @article.title = params[:article][:title]
    @article.url = params[:article][:url]
    if @article.save
      redirect_to articles_path
    else
      render "new"
    end
  end
end


