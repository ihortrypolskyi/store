# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

OrderStatus.delete_all
OrderStatus.create! id: 1, name: "In Progress"
OrderStatus.create! id: 2, name: "Confirmed"
OrderStatus.create! id: 3, name: "Completed"
OrderStatus.create! id: 4, name: "Shipped"
OrderStatus.create! id: 5, name: "Cancelled"

ReviewStatus.delete_all
ReviewStatus.create! id: 1, status: "Draft"
ReviewStatus.create! id: 2, status: "Approved"

