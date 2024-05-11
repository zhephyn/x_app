class LikesController < ApplicationController
  def create
    like_params = {
      likeable_id: params[:likeable_id],
      likeable_type: params[:likeable_type]
    }
    @like = current_user.likes.new(like_params)
    @like.save
    redirect_to tweets_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to tweets_path
  end

  private
  def like_params
    params.require(:like).permit(:likeable_type, :likeable_id)
  end
end
