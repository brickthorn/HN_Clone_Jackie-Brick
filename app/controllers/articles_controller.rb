class ArticlesController < ApplicationController
  def index
  end

  def create
    @article = Article.create(:title => params[:url], :url => params[:url])
    # redirect_to => "www.google.com"
    # redirect_to => @article.url
    # redirect_to => articles_path
  end

  def show
  end

  def new
  end
  
end
