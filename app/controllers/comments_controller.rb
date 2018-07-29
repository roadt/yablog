class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  # GET /comments/1/edit
  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @success = @comment.save
  end


  def update
    @success = @comment.update(comment_params)

  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @success = @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :commentable_id, :commentable_type)
    end
end
