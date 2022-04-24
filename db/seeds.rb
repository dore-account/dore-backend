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

User.create!(uid: '1', email: 'test1')
User.create!(uid: '2', email: 'test2')
User.create!(uid: '3', email: 'test3')

UserDetail.create!(user_id: 1, name: 'test1', gender: 0, introduction: '', birth_day_yy: 1, birth_day_mm: 1,
                   birth_day_dd: 1, twitter_link: '', instagram_link: '', tiktok_link: '')
UserDetail.create!(user_id: 2, name: 'test22', gender: 1, introduction: 'hogehogehgeogheohgeo', birth_day_yy: 1,
                   birth_day_mm: 1, birth_day_dd: 1, twitter_link: '', instagram_link: 'aa', tiktok_link: 'aa')

Creator.create!(user_id: 1)
Creator.create!(user_id: 2)

CreatorInfo.create!(creator_id: 1, belongs: 'サイファークリエイション')

CreatorCategory.create!(creator_id: 1, category_id: 1)
CreatorCategory.create!(creator_id: 2, category_id: 2)
CreatorCategory.create!(creator_id: 2, category_id: 3)

Product.create!(creator_id: 1, status: 1)
ProductInfo.create!(product_id: 1, name: '商品1', description: 'testtest', price: 1000)
ProductInventory.create!(product_id: 1, quantity: 2)

Product.create!(creator_id: 2, status: 1)
ProductInfo.create!(product_id: 2, name: '商品2', description: 'testtest', price: 1000)
ProductInventory.create!(product_id: 2, quantity: 1)
