class CreateUserInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :stan, defalut: ''

      t.timestamps
    end
  end
end
