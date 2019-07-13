class ArticlesController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @articles = Article.all.order("id DESC").page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(text: params[:text], user_id: current_user.id)
    redirect_to :root
  end

  # private
  #   def article_params
  #     params.permit(:text)
  #   end

  private
    def move_to_index
      unless user_signed_in?
        redirect_to action: :index
      end
    end
end
