# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Client.create([{ first_name: 'Mentor', last_name: 'Nila', 'phone_number': '38649841109'}])
Client.create([{ first_name: 'Jon', last_name: 'Nila', 'phone_number': '38649841110'}])

Account.create([{ client_id: 1, balance: 10000 , currency: 'USD', status: 'ACTIVE'}])
Account.create([{ client_id: 2, balance: 0 , currency: 'USD', status: 'ACTIVE'}])
