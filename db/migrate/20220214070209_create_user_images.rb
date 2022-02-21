class CreateUserImages < ActiveRecord::Migration[6.1]
  def change
    create_table :user_images do |t|
      t.references :image, null: false, foreign_key: true
      t.references :user_detail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
