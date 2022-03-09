class ArticlesController < ApplicationController

  before_action :article_find, only: [:show, :edit, :update, :destroy]
  def home
  end

  def show
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
    @article.user = User.last
    if @article.save
      flash[:notice] = "Article succefully created"
      redirect_to @article
    else     
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article edited succefully"
      redirect_to @article
    else
      render 'edit'
    end
  end
  def destroy
    @article.destroy
    redirect_to articles_path
  end
  private 

  def article_find
	@article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end	