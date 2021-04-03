class AddUserIdToNitrogens < ActiveRecord::Migration[6.1]
  def change
    add_column :nitrogens, :user_id, :integer
    add_index :nitrogens, :user_id
  end
end
