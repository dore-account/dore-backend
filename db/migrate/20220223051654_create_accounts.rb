class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :account_id, null: false
      t.boolean :is_completed, null: false, default: false

      t.timestamps
    end
  end
end
