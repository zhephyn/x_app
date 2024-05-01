class QuotesController < ApplicationController
    def new_quote
        @tweet = Tweet.find(params[:id])
        @quote = current_user.quotes.new
    end
    def quote
        @tweet = Tweet.find(params[:id])
        @quote = current_user.quotes.new(quote_params)
        @quote.tweet_id = @tweet.id
        if @quote.save 
            redirect_to  tweet_path(@tweet), notice: "Successfully Quoted Tweet"
        else
            redirect_to tweet_path(@tweet) , notice: "Couldn't Qoute Tweet"
        end
    end

    private
    def quote_params
        params.require(:quote).permit(:body)
    end
end
