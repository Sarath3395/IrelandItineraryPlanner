class CreateLikedLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :liked_locations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
