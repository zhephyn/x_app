class BookmarksController < ApplicationController
    def create
        @bookmark = current_user.bookmarks.new(bookmark_params)
        if @bookmark.save
            redirect_to tweets_path, notice: "Successfully Bookmarked"
        end
    end

    def destroy
        @bookmark = current_user.bookmarks.find(params[:id])
        if @bookmark.destroy
            redirect_to tweets_path, notice: "Successfully removed from Bookmarks"
        end 
    end

    private
    def bookmark_params
      params.require(:bookmark).permit(:bookmarkable_type, :bookmarkable_id)
    end
end
