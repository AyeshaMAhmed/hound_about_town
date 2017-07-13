class AddAttachmentAvatarToPets < ActiveRecord::Migration[5.1]
  def self.up
    change_table :pets do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :pets, :avatar
  end
end
