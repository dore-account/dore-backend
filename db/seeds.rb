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