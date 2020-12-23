class Api::CommentsController < ApplicationController
  before_action :require_logged_in, only: [:create, :filter, :destroy] 

  def index
    case
    when params[:user_id]
      @comments = Comment.where(user_id: params[:user_id])
    when params[:article_id]
      @comments = Comment.where(article_id: params[:article_id])
    else
      @comments = Comment.all
    end
    
    render :index
  end

  def create
    @comment = Comment.new(user_id: current_user.id, article_id: params[:article_id], comment_id: params[:comment_id], body: comment_params[:body]))

    if @comment.save
      render :show
    else
      render json: @comment.errors.full_messages, status: :unprocssable_entity
    end
  end

  def filter
    if params[:filter].blank?
      render json: ['Empty field!']
    else
      @parametr = params[:filter].downcase
      @results = Comment.all.where('lower(name) = ?', params[:article_id])
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end


  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end



