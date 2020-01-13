class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username, null: false
      t.string :password, null: false
      t.integer :organization_id, null: false

      t.timestamps
    end
  end
end
