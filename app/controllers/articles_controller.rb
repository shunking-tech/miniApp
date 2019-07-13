class ArticlesController < ApplicationController

  def index
    @article = Article.all.order("id DESC")
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
