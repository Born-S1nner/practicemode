class CreateNitrogens < ActiveRecord::Migration[6.1]
  def change
    create_table :nitrogens do |t|
      t.string :user_name
      t.string :email
      t.string :phone
      t.string :twitter

      t.timestamps
    end
  end
end
