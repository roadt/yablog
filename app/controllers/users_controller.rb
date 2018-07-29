class UsersController < ApplicationController

  before_action :set_user, only: [:show]
  
  def show
    @feed_items = FeedItem.includes(:ref => :comments).where(user: @user).where("likes_count > 3").page(params[:page])
  end   

  private 

  def set_user
    @user = User.find(params[:id])
  end

end
