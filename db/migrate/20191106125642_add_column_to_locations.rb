class AddColumnToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :scrapper_id, :string
  end
end
