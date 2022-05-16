# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = ["New York", "Chicago", "Seattle", "Washington D.C.", "Denver", "Houston"]
adjectives = ["Gently Used", "Well-Loved", "Heirloom", "Antique", "WANTED", "Slightly damaged"]
descriptions = ["Free to a good home", "(batteries not included)", "As is", "Like new", "(assembly required)", "No returns!!!!"]

# 5.times do
#   user = User.create(
#     username: Faker::Internet.username,
#     city: cities.sample
#   )

#   rand(2..4).times do
#     user.items.create(
#       name: "#{adjectives.sample} #{Faker::Appliance.equipment}",
#       description: descriptions.sample,
#       price: rand(1..500)
#     )
#   end
  def get_department_data

    department_data = RestClient.get('https://collectionapi.metmuseum.org/public/collection/v1/departments')
    if department_data.code == 200
        parsed_department_data = JSON.parse(department_data)
        department_array = parsed_department_data['departments']
        department_array.each { |dept|
            department = Department.create(
                display_name: dept['displayName']
            )
        }
    end

end

get_department_data

# end
