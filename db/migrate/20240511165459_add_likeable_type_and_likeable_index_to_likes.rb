class AddLikeableTypeAndLikeableIndexToLikes < ActiveRecord::Migration[7.1]
  def change
    add_index :likes, [:likeable_id, :likeable_type], name: "index_type_and_id_of_liked_asset", unique: true
  end
end
