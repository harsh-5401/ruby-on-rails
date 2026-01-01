class ArticlesController < ApplicationController
  def show
    # convert regular varaible into instance variable  @
    # byebug
    @article=Article.find(params[:id])
  end

  def index
    @articles=Article.all
  end

end