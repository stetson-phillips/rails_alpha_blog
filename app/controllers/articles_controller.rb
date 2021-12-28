class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
    #can use 'byebug' if installed in gemfile
  end

  def index
    @articles = Article.all 
  end

  def new
    @article = Article.new
  end

  def edit
  end


  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else 
      logger.debug @article.errors.full_messages
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private #should always be towards the bottom - anything under it will be private to this controller only
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end



end
