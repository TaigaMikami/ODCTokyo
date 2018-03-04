# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

CSV.foreach('db/station.csv') do |row|
  Station.create(:name => row[0], :lat => row[1], :lng => row[2])
end

CSV.foreach('db/tourlist_spot.csv') do |row|
  Spot.create(:name => row[0], :lat => row[1], :lng => row[2], :station_id => row[3], :image_url => row[4])
end
