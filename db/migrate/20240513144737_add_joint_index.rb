class AddJointIndex < ActiveRecord::Migration[7.1]
  def change
    add_index :bookmarks, [:bookmarkable_id,:bookmarkable_type, :user_id], name: "index_user_on_bookmarking", unique: true
  end
end
