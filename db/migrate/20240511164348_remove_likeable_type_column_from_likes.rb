class RemoveLikeableTypeColumnFromLikes < ActiveRecord::Migration[7.1]
  def change
    remove_column :likes, :likeable_type, :integer
  end
end
