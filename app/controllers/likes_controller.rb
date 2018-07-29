class LikesController < ApplicationController

  before_action :set_like, only: [:destroy]
  
  def create
    @like = Like.find_or_create_by(user: current_user, 
        likeable_type: like_params[:likeable_type], 
        likeable_id: like_params[:likeable_id]) 
    @success = @like.save
  end

  def destroy
    @success = @like.destroy
  end

  private 

  def set_like
    @like = Like.find(params[:id])
  end

  def like_params
      params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
