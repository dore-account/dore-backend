class CreateCreatorCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :creator_categories do |t|
      t.references :creator, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
