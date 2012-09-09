# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

team1 = Team.create(location_name: 'NA', nickname: 'NA', abbreviation: 'NA')
team2 = Team.create(location_name: 'Georgia', nickname: 'Bulldogs', abbreviation: 'GA')
team3 = Team.create(location_name: 'Florida', nickname: 'Gators', abbreviation: 'FLA')
team4 = Team.create(location_name: 'South Carolina', nickname: 'Gamecocks', abbreviation: 'SCAR')
team5 = Team.create(location_name: 'Tennessee', nickname: 'Volunteers', abbreviation: 'TENN')

player1 = Player.create(first_name: 'James', last_name: 'Wilson', team_id: team1)
player2 = Player.create(first_name: 'John', last_name: 'Smith', team_id: team2)
player3 = Player.create(first_name: 'Robert', last_name: 'Jones', team_id: team3)
player4 = Player.create(first_name: 'Peter', last_name: 'Thomas', team_id: team4)

game_stat1 = GameStat.create(player_id: player1, opponent_id: team1, game_date: '2013-01-01', season: '2013', week: 1)
game_stat2 = GameStat.create(player_id: player1, opponent_id: team1, game_date: '2013-01-08', season: '2013', week: 2)

game_stat3 = GameStat.create(player_id: player2, opponent_id: team3, game_date: '2013-01-01', season: '2013', week: 1)
game_stat4 = GameStat.create(player_id: player2, opponent_id: team4, game_date: '2013-01-08', season: '2013', week: 2)

game_stat5 = GameStat.create(player_id: player3, opponent_id: team2, game_date: '2013-01-01', season: '2013', week: 1)
game_stat6 = GameStat.create(player_id: player3, opponent_id: team5, game_date: '2013-01-08', season: '2013', week: 2)

game_stat7 = GameStat.create(player_id: player4, opponent_id: team5, game_date: '2013-01-01', season: '2013', week: 1)
game_stat8 = GameStat.create(player_id: player4, opponent_id: team2, game_date: '2013-01-08', season: '2013', week: 2)

season_stat1 = GameStat.create(player_id: player1, season: '2013')

season_stat2 = GameStat.create(player_id: player2, season: '2011')
season_stat3 = GameStat.create(player_id: player2, season: '2012')
season_stat4 = GameStat.create(player_id: player2, season: '2013')

season_stat5 = GameStat.create(player_id: player3, season: '2012')
season_stat6 = GameStat.create(player_id: player3, season: '2013')

season_stat7 = GameStat.create(player_id: player4, season: '2014')

career_stat1 = GameStat.create(player_id: player1)
career_stat2 = GameStat.create(player_id: player2)
career_stat3 = GameStat.create(player_id: player3)
career_stat4 = GameStat.create(player_id: player4)

