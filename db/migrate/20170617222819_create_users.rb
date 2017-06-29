class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.integer :age
      t.string :gender
      t.integer :pet_id
      t.string :city
      t.string :state
      t.text :about_me
      t.string :image_url

      t.timestamps
    end
  end
end
