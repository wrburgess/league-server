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

player1 = Player.create(first_name: 'James', last_name: 'Wilson', team_id: team1)
player2 = Player.create(first_name: 'John', last_name: 'Smith', team_id: team2)
player3 = Player.create(first_name: 'Robert', last_name: 'Jones', team_id: team3)
player4 = Player.create(first_name: 'Peter', last_name: 'Thomas', team_id: team4)

