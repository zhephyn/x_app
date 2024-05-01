class AddBodyToQuotes < ActiveRecord::Migration[7.1]
  def change
    add_column :quotes, :body, :text
  end
end
