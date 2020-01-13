class CreateKudosRecipients < ActiveRecord::Migration[6.0]
  def change
    create_table :kudos_recipients do |t|
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false
      t.string :message

      t.timestamps
    end
  end
end
