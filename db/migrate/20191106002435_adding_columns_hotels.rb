class AddingColumnsHotels < ActiveRecord::Migration[6.0]
  def change
    add_column :hotels, :rank, :string
  end
end
