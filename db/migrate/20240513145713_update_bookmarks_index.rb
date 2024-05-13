class UpdateBookmarksIndex < ActiveRecord::Migration[7.1]
  def change
    remove_index :bookmarks, [:bookmarkable_type, :bookmarkable_id], name: "index_bookmark_type_and_id"
    add_index :bookmarks, [:bookmarkable_type, :bookmarkable_id], name: "index_bookmark_type_and_id", unique: true
  end
end
