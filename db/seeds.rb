# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create!(email: "admin@admin.cl", password: "adminadmin", password_confirmation: "adminadmin")

Weapon.create(name: 'Katana', description: "Afilada")
Weapon.create(name: 'Bate', description: "Madera")
Weapon.create(name: 'Pistola', description: "De agua")
Weapon.create(name: 'Lapiz', description: "Bic")
Weapon.create(name: 'Aguja', description: "Punteaguda")

Guest.create(name: "Ana", age: 23, ocupation: "Sansanos")
Guest.create(name: "Bob", age: 23, ocupation: "Sansanos")
Guest.create(name: "Carl", age: 23, ocupation: "Sansanos")
Guest.create(name: "Daril", age: 23, ocupation: "Sansanos")
Guest.create(name: "Erl", age: 23, ocupation: "Sansanos")

Place.create(name: "XL", description: "3x1000")
Place.create(name: "La noni", description: "3x1200")
Place.create(name: "El frances", description: "2hrs pa servir")
Place.create(name: "La casa lila", description: "Lejos")
Place.create(name: "Ali sushi", description: "Shuper")
