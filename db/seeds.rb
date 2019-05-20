# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Lease.destroy_all
Art.destroy_all
User.destroy_all

User.create(
  email: 'tarek@gmail.com',
  password: '123456',
  name: 'Tarek',
)

User.create(
  email: 'luca@gmail.com',
  password: '123456',
  name: 'Luca',
)

User.create(
  email: 'tijani@gmail.com',
  password: '123456',
  name: 'Tijani',
)

wagon = Art.new(
  name: 'Wagon',
  description: 'Great print from the modern era, well maintained',
  artist: 'Boris & Seb',
  location: 'Paris',
  price: 400,
  value: 10000,
  availability: true,
  owner: User.first,
)
url1 = 'https://images.unsplash.com/photo-1534575267360-415018dd4aea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80'
wagon.remote_picture_url = url1
wagon.save

mona = Art.new(
  name: 'Mona',
  description: 'Amazing painting from the impressionist era, pristine condition',
  artist: 'Leonardo',
  location: 'Rome',
  price: 300,
  value: 20000,
  availability: true,
  owner: User.last,
)
url2 = 'https://images.unsplash.com/photo-1556005693-00fff02f134c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2689&q=80'
mona.remote_picture_url = url2
mona.save

drink = Art.new(
  name: 'Drink',
  description: 'Great print from the modern era, well maintained',
  artist: 'Boris & Seb',
  location: 'Paris',
  price: 400,
  value: 10000,
  availability: true,
  owner: User.second,
)
url3 = 'https://images.unsplash.com/photo-1550164362-3363c9d6b09d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80'
drink.remote_picture_url = url3
drink.save



