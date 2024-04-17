class CommentsController < ApplicationController
  def show
    @tweet = Tweet.find(params[:id])
    @comment = @tweet.comments
  end

  def new
    @tweet = Tweet.find(params[:id])
    @comment = @tweet.comments.build
  end

  def create
    @tweet = Tweet.find(params[:id])
    @comment = @tweet.comments.build(comment_params)
    if @comment.save
      redirect_to tweet_path(@tweet)
    else
      render :new
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @comment = @tweet.comments
    if @comment.destroy
      redirect_to tweet_path(@tweet)
  end
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
