class Add < ActiveRecord::Migration[7.1]
  def change
    add_column :bookmarks, :bookmarkable_id, :integer, null: false
  end
end
