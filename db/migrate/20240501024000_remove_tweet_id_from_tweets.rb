class RemoveTweetIdFromTweets < ActiveRecord::Migration[7.1]
  def change
    remove_column :tweets, :tweet_id, :integer
  end
end
