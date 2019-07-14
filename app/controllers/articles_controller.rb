class ArticlesController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @articles = Article.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to :root
  end

  def destroy
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.destroy
      redirect_to :root
    end
  end

  def edit
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      @article = Article.find(params[:id])
    else
      redirect_to :root
    end
  end

  def update
    article = Article.find(params[:id])
    article.update(text: article_params[:text])
    redirect_to :root
  end

  private
    def article_params
      params.permit(:text).merge(user_id: current_user.id)
    end

  private
    def move_to_index
      unless user_signed_in?
        redirect_to action: :index
      end
    end
end
