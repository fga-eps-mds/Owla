# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

member = Member.create!(name: 'Victor Navarro', alias: 'vi',
email: 'victor@gmail.com', password: 'testtest', password_confirmation: 'testtest')

member2 = Member.create!(name: 'Luan Guimarães', alias: 'lu',
email: 'luan@gmail.com', password: 'testtest', password_confirmation: 'testtest')

member3 = Member.create!(name: 'Jéssica Cristina', alias: 'je',
email: 'jessica@gmail.com', password: 'testtest', password_confirmation: 'testtest')

member4 = Member.create!(name: 'Vitor Barbosa', alias: 'vivi',
email: 'vitor@gmail.com', password: 'testtest', password_confirmation: 'testtest')

room = Room.create!(name: 'Humanidade e Cidadania')

room2 = Room.create!(name: 'Fundamentos de Sistemas Distribuidos')

room3 = Room.create!(name: 'Fundamentos de Sistemas Operacionais')
