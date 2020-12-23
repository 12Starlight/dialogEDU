class Api::ArticlesController < ApplicationController
  before_action :require_logged_in, only: [:create, :destroy, :search]

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @articles = @user.articles
      render :index
    else
      @articles = Article.all 
      render :index
    end
  end

  def show
    @article = Article.find(params[:id])

    if @article
      render :show
    else
      render json: @article.errors.full_messages, status: 404
    end

  end

  def search
    if params[:search].blank?
      render json: ['Empty field!']
    else
      @parameter = params[:search].downcase
      @results = Article.all.where('lower(name) LIKE :search', search: @parameter)
    end
  end

  def new
    @article = Article.new
    render :new
  end

  def create
    @article = Article.new(article_params)
    @article.author_id = current_user.id

    if @article.save
      render :show
    else
      render json: @article.errors.full_messages, status: 422
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      render :show
    else
      render json: @articles.errors.full_messages, status: 422      
    end
  end

  def destroy
    @article = Article.find(params[:id])

    if @article.destroy
      render :show
    else
      render json: 'You can not destroy an article that does not exist ;)', status: 422
    end
  end


  private
  def article_params
    params.require(:articles).permit(:title, :body)
  end
end
