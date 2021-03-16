# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

def make_art
    excel_file = CSV.read('public/moma-seed-file.csv', headers: true, encoding:'iso-8859-1:utf-8')
    @paintings = {}
    excel_file.each do |m|
        @paintings = Painting.create(title: m[0], artist: m[1], artistBio: m[2], gender: m[3], date: m[4], medium: m[5], artUrl: m[6], imageUrl: m[7])
    end
end


make_art

