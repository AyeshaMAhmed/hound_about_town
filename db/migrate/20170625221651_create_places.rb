class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :name
      t.string :wineryapi_id

      t.timestamps
    end
  end
end
