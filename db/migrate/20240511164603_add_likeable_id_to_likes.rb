class AddLikeableIdToLikes < ActiveRecord::Migration[7.1]
  def change
    add_column :likes, :likeable_id, :integer, null: false
  end
end
