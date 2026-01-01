class ArticlesController < ApplicationController
  def show
    # convert regular varaible into instance variable  @
    # byebug
    @article=Article.find(params[:id])
  end

  def index
    @articles=Article.all
  end

  def new
    # @article = Article.new
  end

  def create
    # render plain: params[:article]
    @article=Article.new(params.require(:article).permit(:title, :description))
    # render plain: @article
    @article.save
    redirect_to article_path(@article)
  end

end