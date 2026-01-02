class ArticlesController < ApplicationController
  before_action :get_article_by_id, only: [ :show, :edit, :destroy, :update]

  def show
    # convert regular varaible into instance variable  @
    # byebug
    # @article=Article.find(params[:id])
  end

  def index
    @articles=Article.all
  end

  def new
    @article = Article.new
  end

  def create
    # render plain: params[:article]
    @article=Article.new(article_params)
    # render plain: @article
    if @article.save
      flash[:notice] = "Article was created succesfully"
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end

  end

  def edit
    # @article=Article.find(params[:id])
  end


  def update
    @article=Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was updated succesfully"
    else
      render :edit
    end
  end

  def destroy
    # @article=Article.find(params[:id])
    # @article=get_article_by_id(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def get_article_by_id
    @article=Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end



end