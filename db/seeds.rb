# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(name: 'TikToker')
Category.create!(name: 'インスタグラマー')
Category.create!(name: 'アイドル')
Category.create!(name: 'メイド')
Category.create!(name: '一般人')

User.create!(uid: "1", email: "test1")
User.create!(uid: "2", email: "test2")
User.create!(uid: "3", email: "test3")

UserDetail.create!(user_id: 1, slug: "", name: "test1", gender: 0, introduction: "", birth_day_yy: 1, birth_day_mm: 1, birth_day_dd: 1, twitter_link: "", instagram_link: "", tiktok_link: "")

Creator.create!(user_id: 1)