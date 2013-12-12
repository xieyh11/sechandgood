namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_categories
    make_goods
  end
end

def make_users
  admin = User.create!(name: "xieyh11",
            userid: "2011012344", 
            password: "xxxxxx", 
            contact: "18810461787", 
            password_confirmation: "xxxxxx",
            admin: true)
  user = User.create!(name: "ymt11",
            userid: "2011012362",
            password: "yyyyyy",
            contact: "18810461820",
            password_confirmation: "yyyyyy")
  99.times do |n|
    name  = Faker::Name.name + n.to_s
    contact = "18810461787"
    if n.to_s.length == 1
      userid = "201101220#{n}"
    else
      userid = "20110122#{n}"
    end
    password  = "password"
    User.create!(name: name,
          userid: userid, 
          contact: contact, 
          password: password,
          password_confirmation: password)
  end
end

def make_categories
  10.times do |n|
    title = Faker::Lorem.word + n.to_s
    Category.create!(title: title)
  end
end

def make_goods
  categories = Category.all
  User.all.each do |user|
    5.times do
      title = Faker::Lorem.words(10).sample
      content = Faker::Lorem.sentence(50)
      category_id = categories.sample.id
      user.goods.create!(title: title, content: content, category_id: category_id)
    end
  end
end
