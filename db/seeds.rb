# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1=User.create(email: 'admin@gmail.com',password: 'password',password_confirmation: 'password',first_name: 'AdminFirstName', last_name: 'AdminLastName', admin: 1, contact_number: 4893823429, address: 'some address')
u1=User.create(email: 'user@gmail.com',password: 'password',password_confirmation: 'password',first_name: 'userFirstName', last_name: 'userLastName', admin: 0, contact_number: 4893823429, address: 'some other address')