class CreateUserplaces < ActiveRecord::Migration[5.1]
  def change
    create_table :userplaces do |t|
      t.integer :user_id
      t.integer :place_id

      t.timestamps
    end
  end
end
