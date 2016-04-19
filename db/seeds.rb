# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#OLD SEEDS CODE FOR Rottenpotatoes page HW4

movies = [{:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'},
    	  {:title => 'The Terminator', :rating => 'R', :release_date => '26-Oct-1984'},
    	  {:title => 'When Harry Met Sally', :rating => 'R', :release_date => '21-Jul-1989'},
      	  {:title => 'The Help', :rating => 'PG-13', :release_date => '10-Aug-2011'},
      	  {:title => 'Chocolat', :rating => 'PG-13', :release_date => '5-Jan-2001'},
      	  {:title => 'Amelie', :rating => 'R', :release_date => '25-Apr-2001'},
      	  {:title => '2001: A Space Odyssey', :rating => 'G', :release_date => '6-Apr-1968'},
      	  {:title => 'The Incredibles', :rating => 'PG', :release_date => '5-Nov-2004'},
      	  {:title => 'Raiders of the Lost Ark', :rating => 'PG', :release_date => '12-Jun-1981'},
      	  {:title => 'Chicken Run', :rating => 'G', :release_date => '21-Jun-2000'},
  	 ]

movies.each do |movie|
  Movie.create!(movie)
end

#NEW CODE
# require 'csv'
# #Assuming sample.csv is stored in the root folder (Can be changed to wherever michhael is storing the file)
# data = Rails.root + "sample.csv"
# csv_data = CSV.read data
# headers = csv_data.shift.map do |i|
#     i.to_s.to_sym
# end
# string_data = csv_data.map do |row| 
#     row.map do |cell|
#         cell.to_s
#     end
# end
# array_of_hashes = []
# string_data.map do |row| 
#     array_of_hashes << Hash[*headers.zip(row).flatten]
# end
# puts array_of_hashes
# array_of_hashes.each do |movie|
#   Movie.create!(movie)
# end
=begin
http://railscasts.com/episodes/362-exporting-csv-and-excel?view=asciicast
http://stackoverflow.com/questions/16987242/ransack-export-results-to-csv
=end