# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

admin_user = User.create(email: "wrburgess@wrburgess.com", password: "secret")

(1..50).each do |u|
  user = User.create(email: "user#{u}@example.com", password: "secret")
  puts "User created: user#{u}@example.com"
end

(2..100).each do |u|
  user = User.create(email: "test#{u}@test.com")
  puts "User created: test#{u}@test.com"
end

CSV.foreach("#{Rails.root}/db/fill/teams.csv") do |row|
  Team.create!(location_name: row[0], nickname: row[1], abbreviation: row[2])
  puts "Team created: #{row[0]}, #{row[1]}, #{row[2]}"
end

CSV.foreach("#{Rails.root}/db/fill/groups.csv") do |row|
  Group.create!(name: row[0], abbreviation: row[1])
  puts "Roster created: #{row[0]}, #{row[1]}"
end

CSV.foreach("#{Rails.root}/db/fill/rosters.csv") do |row|
  Roster.create!(name: row[0], abbreviation: row[1])
  puts "Roster created: #{row[0]}, #{row[1]}"
end

CSV.foreach("#{Rails.root}/db/fill/group_rosters.csv") do |row|
  Group_Roster.create!(group_id: row[0], roster_id: row[1])
  puts "Group_Roster created: #{row[0]}, #{row[1]}"
end

CSV.foreach("#{Rails.root}/db/fill/roster_users.csv") do |row|
  RosterUser.create!(roster_id: row[0], user_id: row[1], founder: row[2], owner: row[3], viewer: row[4])
  puts "Roster_User created: #{row[0]}, #{row[1]}"
end

CSV.foreach("#{Rails.root}/db/fill/group_users.csv") do |row|
  Group_User.create!(group_id: row[0], user_id: row[1], founder: row[2], owner: row[3], viewer: row[4])
  puts "Group_User created: #{row[0]}, #{row[1]}"
end

(1..200).each do |p|
  team_id = rand(1..100)
  date1 = "2013-01-01"
  date2 = "2013-12-31"
  game_date = Time.now

  player = Player.create(first_name: "John#{p}", last_name: "Wilson#{p}", team_id: team_id)
  puts "Player created: John#{p} Wilson#{p}, Team: #{team_id}"

  career_stat = CareerStat.create(player_id: player)
  puts "CareerStat created: John#{p} Wilson#{p}, ID: #{team_id}"

  (2011..2013).each do |ss|
    season_stat = SeasonStat.create(player_id: player, season: ss)
    puts "SeasonStat created: John#{p} Wilson#{p}, Season: #{ss}"
  end

  (1..15).each do |gs|
    game_stat = GameStat.create(player_id: player.id, opponent_id: rand(1..100), game_date: game_date, season: "2013", week: gs)
    puts "GameStat created: John#{p} Wilson#{p}, Team: #{team_id}"
    game_date + 7.days
  end
end

