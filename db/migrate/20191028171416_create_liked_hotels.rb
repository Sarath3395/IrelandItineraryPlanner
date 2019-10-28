class CreateLikedHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :liked_hotels do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hotel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
