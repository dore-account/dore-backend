class CreateProductInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :product_infos do |t|
      t.references :product, null: false, foreign_key: true
      t.string :name, null: false, default: ''
      t.string :description, null: false, default: ''
      t.integer :price, null: false

      t.timestamps
    end
  end
end
