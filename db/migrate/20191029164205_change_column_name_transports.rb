class ChangeColumnNameTransports < ActiveRecord::Migration[6.0]
  def change
    rename_column :transports, :type, :transporttype
  end
end
