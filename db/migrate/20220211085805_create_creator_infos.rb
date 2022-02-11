class CreateCreatorInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :creator_infos do |t|
      t.references :creator, null: false, foreign_key: true
      t.string :belongs, defalut: ''

      t.timestamps
    end
  end
end
