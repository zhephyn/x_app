class RetweetsController < ApplicationController
    def retweet
        @tweet = Tweet.find(params[:id])
        @retweet = current_user.retweets.new(tweet_id: @tweet.id)
        if @retweet.save
            redirect_to tweet_path(@tweet), notice: "Successfully retweeted Tweet"
        else
            redirect_to tweet_path(@tweet), notice: "Failed to retweet"
        end
    end
end
