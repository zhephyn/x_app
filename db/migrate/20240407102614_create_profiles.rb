class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.text :bio
      t.string :location
      t.string :website

      t.timestamps
    end
  end
end
