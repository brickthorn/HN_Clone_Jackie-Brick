class ArticlesController < ApplicationController
  def index
    
  end

  def create
    url = params[:url] 
    url = "http://" + url if !url.include?("http://") if url != ""
    @article = Article.new(:title => params[:title], :url => url)
    if @article.save
      redirect_to articles_path
    else 
      @article.errors.messages.first.name
      flash[:alert] = "Invalid Url or Title. Try again!"
      render "new"
    end
  end
  
  # def multiple_article_test(url)
  #   Article.all.each do |article|
  #     return true if article.url == url
  #   end
  #   return false
  # end

  def show
  end

  def new
  end
  
end
