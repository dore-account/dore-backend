class CreatePaymentMethods < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_methods do |t|
      t.references :user, null: false, foreign_key: true
      t.string :provider, null: false, default: ''
      t.string :type, null: false, default: ''

      t.timestamps
    end
  end
end
