class AddTranscrapperIdRestscrapperIdToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :transcrapper_id, :string
    add_column :locations, :restscrapper_id, :string
  end
end
