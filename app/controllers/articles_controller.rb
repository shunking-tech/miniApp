class ArticlesController < ApplicationController

  def index
    @article = Article.all
  end

  def new
    @articles = Article.new
  end
end
