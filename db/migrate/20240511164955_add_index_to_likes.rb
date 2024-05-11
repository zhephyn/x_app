class AddIndexToLikes < ActiveRecord::Migration[7.1]
  def change
    add_index :likes, [:likeable_id, :likeable_type, :user_id], name: "index_user_id_and_likeable_type_and_id_on_likes", unique: true
  end
end
