class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.integer :user_id
      t.string :name
      t.string :gender
      t.integer :age
      t.string :image_url

      t.timestamps
    end
  end
end
