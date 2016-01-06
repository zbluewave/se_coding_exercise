# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require File.expand_path('../../app/packages/nyc_data_loader/loader', __FILE__)

loader = NycDataLoader::Loader.new

prefix = File.expand_path('../nyc_data', __FILE__) + '/'

loader.load_from_file(prefix + 'data1.json')
loader.load_from_file(prefix + 'data2.json')
loader.load_from_file(prefix + 'data3.json')