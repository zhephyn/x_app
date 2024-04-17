class AddTweetIdToComments < ActiveRecord::Migration[7.1]
  def change
    add_reference :comments, :tweet, null: false, foreign_key: true
  end
end
