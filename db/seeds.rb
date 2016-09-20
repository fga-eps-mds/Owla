# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating Victor Navarro User"
member = Member.create!(name: 'Victor Navarro', alias: 'vi',
email: 'victor@gmail.com', password: 'testtest', password_confirmation: 'testtest')

puts "Creating Luan Guimarães User"
member2 = Member.create!(name: 'Luan Guimarães', alias: 'lu',
email: 'luan@gmail.com', password: 'testtest', password_confirmation: 'testtest')

puts "Creating Jessica Cristina User"
member3 = Member.create!(name: 'Jéssica Cristina', alias: 'je',
email: 'jessica@gmail.com', password: 'testtest', password_confirmation: 'testtest')

puts "Creating Vitor Barbosa User"
member4 = Member.create!(name: 'Vitor Barbosa', alias: 'vivi',
email: 'vitor@gmail.com', password: 'testtest', password_confirmation: 'testtest')

puts "Creating Humanidades e Cidadania room"
member2.rooms.create!(name: 'Humanidade e Cidadania', description: 'Professora Sônia Albuquerque')

puts "Creating Fundamentos de Sistemas Distribuidos room"
member2.rooms.create!(name: 'Fundamentos de Sistemas Distribuidos', description: 'Professor Fernando W. Cruz')

puts "Creating Palestra Empreendendo sua Igreja room"
member2.rooms.create!(name: 'Palestra Empreendendo sua Ideia', description: 'Palestrante José Joaquim')

top = member2.topics.create(name: 'Salvando o Planeta')
member2.rooms.first.topics << top
top.save
