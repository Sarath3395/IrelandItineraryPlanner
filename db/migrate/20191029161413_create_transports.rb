class CreateTransports < ActiveRecord::Migration[6.0]
  def change
    create_table :transports do |t|
      t.string :name
      t.string :type
      t.string :origin
      t.string :destination
      t.datetime :departure
      t.datetime :arrival
      t.string :price
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
