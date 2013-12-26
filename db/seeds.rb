# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin = User.create name: "xieyh11", userid: "2011012344", password: "xxxxxx", contact: "18810461787", password_confirmation: "xxxxxx", admin: true
customer1 = User.create name: "ymt11", userid: "2011012362", password: "yyyyyy", contact: "18810461820", password_confirmation: "yyyyyy"
customer2 = User.create name: "shen", userid: "2011011330", password: "ssssss", contact: "18810461787", password_confirmation: "ssssss"

book = Category.create(title: "book")
bicycle = Category.create(title: "bicycle")
lesson = Category.create(title: "lesson")
other = Category.create(title: "other")
