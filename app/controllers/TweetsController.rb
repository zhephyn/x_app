class TweetsController < ApplicationController
    #before_action :authenticate_user! for all actions
    #before_action :set_post for show,update,edit and destroy
    def home
    end

    def index
        @tweets = Tweet.all
    end

    def show
    end

    def new
        @tweet = Tweet.new
    end

    def create
        @tweet = Tweet.new(tweet_params)
        @tweet.save
    end 

    def edit
        @tweet = Tweet.update
    end

    def update
        @tweet = Tweet.update(tweet_params)
        @tweet.save
    end

    def destroy
        @tweet = Tweet.destroy
        redirect_to tweets_path
    end

    private
    def tweet_params
        params.require(tweet).permit(:body)
    end
    
    def set_post
        @tweet = Tweet.find(params[:id])
    end
end