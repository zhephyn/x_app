class CommentsController < ApplicationController
  def new
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.build
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @comment = @tweet.comments.create(comment_params)
    if @comment.save
      redirect_to tweet_path(@tweet)
    else
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
        @comment.destroy
        redirect_to tweet_path(@tweet), notice: "Comment was successfully deleted"
    else
      redirect_to tweets_path, notice: "You can't delete a comment you didn't create"
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
end
