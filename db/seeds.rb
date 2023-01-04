# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Tag.create!(
  [
    {
      classification: 0,
      name: '仕事',
      user_id: 2
    },
    {
      classification: 0,
      name: '遊び',
      user_id: 2
    },
    {
      classification: 0,
      name: '家族',
      user_id: 2
    },
    {
      classification: 0,
      name: '固定費',
      user_id: 2
    },
    {
      classification: 0,
      name: '日用品',
      user_id: 2
    },
    {
      classification: 0,
      name: '食費',
      user_id: 2
    },
    {
      classification: 0,
      name: '遊び',
      user_id: 2
    }
  ]
)
