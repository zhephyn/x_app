class AddRetweetIdToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :retweet, null: true, foreign_key: true
  end
end
