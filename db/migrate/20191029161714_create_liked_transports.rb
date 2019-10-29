class CreateLikedTransports < ActiveRecord::Migration[6.0]
  def change
    create_table :liked_transports do |t|
      t.references :user, null: false, foreign_key: true
      t.references :transport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
