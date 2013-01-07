# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

(1..50).each do |u|
  user = User.create(email: "user#{u}@example.com", password: "secret")
  puts "User created: user#{u}@example.com"
end

admin_user = User.create(email: "wrburgess@wrburgess.com", password: "secret")

CSV.foreach("#{Rails.root}/db/fill/player_teams.csv") do |row|
  PlayerTeam.create!(location_name: row[0], nickname: row[1], abbreviation: row[2])
  puts "PlayerTeam created: #{row[0]}, #{row[1]}, #{row[2]}"
end

CSV.foreach("#{Rails.root}/db/fill/groups.csv", :headers => :first_row) do |row|
  Group.create!(name: row[0], abbreviation: row[1])
  puts "Roster created: #{row[0]}, #{row[1]}"
end

CSV.foreach("#{Rails.root}/db/fill/rosters.csv", :headers => :first_row) do |row|
  roster = Roster.create!(name: row[0], abbreviation: row[1])

  (1..15).each do |rsg|
    RosterStatGame.create!(roster_id: roster.id, season: 2012, week: rsg)
    puts "RosterStatGame created"
  end

  (1..15).each do |rsg|
    RosterStatGame.create!(roster_id: roster.id, season: 2013, week: rsg)
    puts "RosterStatGame created"
  end

  RosterStatSeason.create!(roster_id: roster.id, season: 2012)
  puts "RosterStatSeason created"
  RosterStatSeason.create!(roster_id: roster.id, season: 2013)
  puts "RosterStatSeason created"

  RosterStatCareer.create!(roster_id: roster.id)
  puts "RosterStatCareer created"

  puts "Roster created: #{row[0]}, #{row[1]}"
end

CSV.foreach("#{Rails.root}/db/fill/group_rosters.csv", :headers => :first_row) do |row|
  GroupRoster.create!(group_id: row[0], roster_id: row[1], group_division_id: row[2])
  puts "GroupRoster created: #{row[0]}, #{row[1]}, #{row[2]}"
end

CSV.foreach("#{Rails.root}/db/fill/roster_users.csv", :headers => :first_row) do |row|
  RosterUser.create!(roster_id: row[0], user_id: row[1], founder: row[2], owner: row[3], viewer: row[4])
  puts "RosterUser created: #{row[0]}, #{row[1]}"
end

CSV.foreach("#{Rails.root}/db/fill/group_users.csv", :headers => :first_row) do |row|
  GroupUser.create!(group_id: row[0], user_id: row[1], founder: row[2], owner: row[3], viewer: row[4])
  puts "GroupUser created: #{row[0]}, #{row[1]}"
end

(1..200).each do |p|
  player_team_id = rand(1..100)
  date1 = "2013-01-01"
  date2 = "2013-12-31"
  game_date = Time.now

  player = Player.create(first_name: "John#{p}", last_name: "Wilson#{p}", player_team_id: player_team_id)
  puts "Player created: John#{p} Wilson#{p}, Player Team: #{player_team_id}"

  player_stat_career = PlayerStatCareer.create(player_id: player.id)
  puts "CareerStat created: John#{p} Wilson#{p}"

  (2011..2013).each do |ss|
    player_stat_season = PlayerStatSeason.create(player_id: player.id, season: ss)
    puts "SeasonStat created: John#{p} Wilson#{p}, Season: #{ss}"
  end

  (1..15).each do |gs|
    game_stat = PlayerStatGame.create(player_id: player.id, opponent_id: rand(1..100), game_date: game_date, season: "2013", week: gs)
    puts "GameStat created: John#{p} Wilson#{p}, Team: #{player_team_id}"
    game_date + 7.days
  end
end

