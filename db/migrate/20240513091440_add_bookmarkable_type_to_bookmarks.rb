class AddBookmarkableTypeToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_column :bookmarks, :bookmarkable_type, :string, null: false
  end
end
