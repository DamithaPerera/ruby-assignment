# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'elasticsearch'

client = Elasticsearch::Client.new(url: 'http://localhost:9200')

# Create index if not exists
unless client.indices.exists(index: 'verticals')
  client.indices.create(index: 'verticals')
end

# Proceed with seeding
Vertical.destroy_all
Category.destroy_all
Course.destroy_all

verticals = JSON.parse(File.read(Rails.root.join('db/seeds/verticals.json')))
categories = JSON.parse(File.read(Rails.root.join('db/seeds/categories.json')))
courses = JSON.parse(File.read(Rails.root.join('db/seeds/courses.json')))

verticals.each do |v|
  Vertical.create!(id: v['Id'], name: v['Name'])
end

categories.each do |c|
  Category.create!(id: c['Id'], name: c['Name'], vertical_id: c['Verticals'], state: c['State'])
end

courses.each do |c|
  Course.create!(id: c['Id'], name: c['Name'], author: c['Author'], category_id: c['Categories'], state: c['State'])
end

# Create a default admin user if not exists
User.find_or_create_by!(email: 'admin@example.com') do |user|
  user.password = '123456'
  user.password_confirmation = '123456'
end