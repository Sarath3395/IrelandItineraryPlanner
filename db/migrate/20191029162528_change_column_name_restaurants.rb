class ChangeColumnNameRestaurants < ActiveRecord::Migration[6.0]
  def change
    rename_column :restaurants, :type, :foodtype
  end
end
