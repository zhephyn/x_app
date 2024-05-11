class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)
    if @like.save
      redirect_to tweets_path, notice: "Successfully liked"
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    if @like.destroy
      redirect_to tweets_path, notice: "Successfully unliked"
    end 
  end

  private
  def like_params
    params.require(:like).permit(:likeable_type, :likeable_id)
  end
end
