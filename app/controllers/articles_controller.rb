class ArticlesController < ApplicationController

  def index
    @articles = Article.all.order("id DESC").page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(text: params[:text], user_id: 1)
    redirect_to :root
  end

  # private
  #   def article_params
  #     params.permit(:text)
  #   end
end
