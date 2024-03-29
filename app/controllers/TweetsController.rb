class TweetsController < ApplicationController
    #before_action :authenticate_user! for all actions
    #before_action :set_post for show,update,edit and destroy
    #each tweet is only deleted, edited , updated by the user who created it
    def home
    end

    def index
        #should be nicknamed profile, use devise helper called current_user, current_user should be used with other actions too
        @user = current_user
        @tweets = @user.tweets
    end

    def show
        @user = current_user
        @tweet = @user.tweets.find(params[:id])
    end

    def new
        if user_signed_in?
            @user = current_user
            @tweet = @user.tweets.build
        else
            redirect_to :root
        end
    end

    def create
        @user = current_user
        @tweet = @user.tweets.create(tweet_params)
        @tweet.save
    end 

    def edit
        @user = current_user
        @tweet = @user.tweets.find(params[:id])
        @updated_tweet = @tweet.update
    end

    def update
        @user = current_user
        @tweet = @user.tweets.find(params[:id])
        @updated_tweet = @tweet.update(tweet_params)
        @updated_tweet.save
    end

    def destroy
        @user = current_user
        @tweet = @user.tweets.find(params[:id])
        @tweet.destroy
    end

    private
    ##for params, other parameters include a location for each tweet, images/image attachments
    def tweet_params
        params.require(:tweet).permit(:body)
    end
    
    def set_post
        @tweet = Tweet.find(params[:id])
    end
end