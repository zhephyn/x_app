class AddUsersToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_reference :profiles, :users, null: false, foreign_key: true
  end
end
