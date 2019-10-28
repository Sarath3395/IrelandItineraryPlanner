class CreateHotels < ActiveRecord::Migration[6.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :roomtype
      t.datetime :fromdate
      t.string :coordinates
      t.string :address
      t.datetime :todate
      t.string :price
      t.string :noofrooms
      t.string :noofperson
      t.string :bedtype
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
