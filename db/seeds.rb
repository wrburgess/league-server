# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

admin_user = User.create(email: "wrburgess@wrburgess.com", password: "secret")

(2..100).each do |u|
  user = User.create(email: "test#{u}@test.com")
  puts "User created: test#{u}@test.com"
end

CSV.foreach("#{Rails.root}/db/fill/teams.csv") do |row|
  Team.create!(location_name: row[0], nickname: row[1], abbreviation: row[2])
  puts "Team created: #{row[0]}, #{row[1]}, #{row[2]}"
end

(1..200).each do |p|
  team_id = rand(1..100)
  player = Player.create(first_name: 'John#{p}', last_name: 'Wilson#{p}', team_id: team_id)
  puts "Player created: John#{p} Wilson#{p}, Team: #{team_id}"
end

# player1 = Player.create(first_name: 'James', last_name: 'Wilson', team_id: team1)
# player2 = Player.create(first_name: 'John', last_name: 'Smith', team_id: team2)
# player3 = Player.create(first_name: 'Robert', last_name: 'Jones', team_id: team3)
# player4 = Player.create(first_name: 'Peter', last_name: 'Thomas', team_id: team4)

# game_stat1 = GameStat.create(player_id: player1, opponent_id: team1, game_date: '2013-01-01', season: '2013', week: 1)
# game_stat2 = GameStat.create(player_id: player1, opponent_id: team1, game_date: '2013-01-08', season: '2013', week: 2)

# game_stat3 = GameStat.create(player_id: player2, opponent_id: team3, game_date: '2013-01-01', season: '2013', week: 1)
# game_stat4 = GameStat.create(player_id: player2, opponent_id: team4, game_date: '2013-01-08', season: '2013', week: 2)

# game_stat5 = GameStat.create(player_id: player3, opponent_id: team2, game_date: '2013-01-01', season: '2013', week: 1)
# game_stat6 = GameStat.create(player_id: player3, opponent_id: team5, game_date: '2013-01-08', season: '2013', week: 2)

# game_stat7 = GameStat.create(player_id: player4, opponent_id: team5, game_date: '2013-01-01', season: '2013', week: 1)
# game_stat8 = GameStat.create(player_id: player4, opponent_id: team2, game_date: '2013-01-08', season: '2013', week: 2)

# season_stat1 = GameStat.create(player_id: player1, season: '2013')

# season_stat2 = GameStat.create(player_id: player2, season: '2011')
# season_stat3 = GameStat.create(player_id: player2, season: '2012')
# season_stat4 = GameStat.create(player_id: player2, season: '2013')

# season_stat5 = GameStat.create(player_id: player3, season: '2012')
# season_stat6 = GameStat.create(player_id: player3, season: '2013')

# season_stat7 = GameStat.create(player_id: player4, season: '2014')

# career_stat1 = GameStat.create(player_id: player1)
# career_stat2 = GameStat.create(player_id: player2)
# career_stat3 = GameStat.create(player_id: player3)
# career_stat4 = GameStat.create(player_id: player4)

