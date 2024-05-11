class AddLikeableTypeToLikes < ActiveRecord::Migration[7.1]
  def change
    add_column :likes, :likeable_type, :string, null: false
  end
end
