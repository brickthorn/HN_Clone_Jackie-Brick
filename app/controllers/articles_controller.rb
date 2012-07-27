class ArticlesController < ApplicationController


  def index
    # Article.order(:title)
    # sql = "SELECT * FROM articles LEFT OUTER JOIN votes ON votes.posting_id = articles.id GROUP BY posting_id ORDER BY COUNT(*) DESC"
    # sql = "SELECT * FROM articles LEFT OUTER JOIN votes ON votes.posting_id = articles.id AND votes.posting_type = 'Article' GROUP BY posting_id ORDER BY COUNT(*) DESC"
    # sql = "SELECT *, COUNT(*) as vote_count FROM articles LEFT OUTER JOIN votes ON votes.posting_id = articles.id AND votes.posting_type = 'Article' GROUP BY posting_id ORDER BY COUNT(*) DESC"
    # @articles = ActiveRecord::Base.connection.execute(sql)
    # warn @articles.inspect
    # @articles = Article.select(:*).select('COUNT(*) as vote_count').joins.group(:posting_id).order('COUNT(*) DESC')
    # @remaining_articles = Article.all - @articles
    #@articles.each { |article| warn article.inspect }
    # puts @articles.length
    # Article.all.each { |article| puts article.inspect }
    # puts "=============================================================="
    # @remaining_articles.each { |article| puts article.inspect }
    # puts @remaining_articles.length
    # puts Article.all.length
    # @articles = Article.all
    @articles = Article.order(:vote_count).reverse_order
  end

  def join_on_votes
    ActiveRecord::Base.connection.execute("LEFT OUTER JOIN votes ON votes.posting_id = articles.id")
  end

  def new
    @article = Article.new
  end


  def create
    @article = Article.new(params[:article])   # get url and title from params
    # @article.title = params[:article][:title]     @article.url = params[:article][:url]
    @article.owner = current_user
    @article.url = "http://" + @article.url if !@article.url.include?("http://") if @article.url != ""  # add a validation in article model before_validation:
    if @article.save
      redirect_to articles_path
    else
      render "new"
    end
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


