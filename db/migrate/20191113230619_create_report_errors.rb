class CreateReportErrors < ActiveRecord::Migration[6.0]
  def change
    create_table :report_errors do |t|
      t.string :errormessage
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
