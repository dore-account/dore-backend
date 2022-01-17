class CreateUserDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :user_details do |t|
      t.references :user, foreign_key: true
      t.string :uid
      t.string :name, defalut: ''
      t.integer :gender, null: false, defalut: 0
      t.string :introduction, defalut: ''
      t.integer :birth_day_yy
      t.integer :birth_day_mm
      t.integer :birth_day_dd
      t.string :twitter_link
      t.string :instagram_link
      t.string :tiktok_link

      t.timestamps
    end
  end
end
