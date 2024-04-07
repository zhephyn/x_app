class DeleteUsersColumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :profiles, :users_id
  end
end
