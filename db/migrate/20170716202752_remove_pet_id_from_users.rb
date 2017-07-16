class RemovePetIdFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :pet_id, :integer
  end
end
