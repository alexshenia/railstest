# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gold = Hall.create!(name: 'Gold')
silver = Hall.create!(name: 'Silver')

(1..rand(10)).each do |row|
  (1..30).each do |number|
    Seat.create!(hall_id: silver.id, number: number, row: row) if row < 4 && number < 16
    Seat.create!(hall_id: gold.id, number: number, row: row)
  end
end

['Black Panther','Avengers:Infinity War','Solo: A Star Wars Story','The Incredibles 2'].each_with_index do |title, index|
  movie = Movie.create!(title: title)
  (0..rand(6)).each do |n_days|
    data = { gold.id => [['09:30', '15:00'], ['11:00', '19:30'], ['13:30', '21:00'], ['07:30', '23:00'] ],
             silver.id => [['06:30', '9:00'], ['11:00', '13:30'], ['15:30', '17:00'], ['19:30', '22:00'] ] }
    [gold.id, silver.id].each do |id|
      data[id][index].each do |time|
        parsed_time = (Time.zone.parse(time) + n_days.days)
        Show.create!(movie_id: movie.id, hall_id: id, start_at: parsed_time)
      end
    end
  end
end

User.create(email: 'test@example.com', password: '12345678')