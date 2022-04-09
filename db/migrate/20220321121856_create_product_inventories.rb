class CreateProductInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :product_inventories do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
