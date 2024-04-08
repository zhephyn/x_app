class TweetsController < ApplicationController
    #before_action :authenticate_user! for all actions
    #before_action :set_post for show,update,edit and destroy
    #each tweet is only deleted, edited , updated by the user who created it
    def home
    end

    def index
        if user_signed_in?
            @tweets = Tweet.all
        else
            redirect_to :root, notice: "You need to sign in or create an account with us to view tweets"
        end 
    end
    def show
        if user_signed_in?
            @tweet = Tweet.find(params[:id])
            @username = @tweet.user.username
        else
            ##render a page for the user to sign in or register first
        end
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
        redirect_to tweet_path(@tweet)
    end 

    def edit
        @tweet = Tweet.find(params[:id])
        if current_user.id == @tweet.user_id
            render :edit
        else
            redirect_to tweets_path, alert: "You can't edit this tweet since you didnot create it"
        end
    end

    def update
        @tweet = Tweet.find(params[:id])
        if current_user.id == @tweet.user_id   
            @tweet.update(tweet_params)
            @tweet.save
            redirect_to tweet_path(@tweet), notice: "Tweet is successfully updated"
        else
            redirect_to :root, alert: "You can't edit a tweet you didnt create"
        end
    end

    def destroy
        @tweet = Tweet.find(params[:id])
        if current_user.id == @tweet.user_id
            @tweet.destroy
            redirect_to tweets_path
        else
            redirect_to :root
        end
    end

    private
    def tweet_params
        params.require(:tweet).permit(:body)
    end
    
    def set_post
        @tweet = Tweet.find(params[:id])
    end
end