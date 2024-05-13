class AddBookmarksIndexToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_index :bookmarks, [:bookmarkable_type, :bookmarkable_id], name: "index_bookmark_type_and_id"
  end
end
