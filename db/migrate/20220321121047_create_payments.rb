class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.references :payment_method, null: false, foreign_key: true

      t.timestamps
    end
  end
end
