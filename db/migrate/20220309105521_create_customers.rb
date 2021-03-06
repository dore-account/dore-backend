class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :stripe_customer_id, null: false

      t.timestamps
    end
  end
end
