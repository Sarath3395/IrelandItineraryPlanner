class AddColumnToReportError < ActiveRecord::Migration[6.0]
  def change
    add_column :report_errors, :assignstatus, :string
  end
end
