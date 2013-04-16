# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
stream_list =  [ [ 1,  "Mathematics", "Mathematics"],
                 [ 2,  "Physics", "Physics"], 
                 [ 3,  "Medical Science", "Medicine"],
                 [ 4,  "Biotechnology", "Biotechnology"],
                 [ 5,  "Nanotechnology", "Nanotechnology"],
                 [ 6,  "Aerospace Engineering", "Aerospace"],
                 [ 7,  "Computer Science Engineering", "ComputerScience"], 
                 [ 8,  "Electronics and Communication Engineering", "Electronics"],
                 [ 9,  "Chemical Engineering", "Chemical"],
                 [ 10, "Management", "Management"],
                 [ 11, "Career News and Interviews", "Career"],
                 [ 12, "General",  "General"] ]

 
 stream_list.each do |id,name,table|
  Stream.create( stream_id: id, stream_name: name, stream_table_name: table )
end     