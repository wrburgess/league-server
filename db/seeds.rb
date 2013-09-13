CSV.foreach("#{Rails.root}/db/fill/system_periods.csv", :headers => :first_row) do |row|
  SystemPeriod.create!(
    period: row["period"], 
    start_date: DateTime.strptime(row["start_date"], "%m/%d/%Y"), 
    end_date: DateTime.strptime(row["end_date"], "%m/%d/%Y")
  )
end
puts "SystemPeriods created"

RosterSlotType.create!(name: "Starter", abbreviation: "START", weight: 10)
RosterSlotType.create!(name: "Reserve", abbreviation: "RESV", weight: 20)
RosterSlotType.create!(name: "Injured", abbreviation: "INJ", weight: 30)
RosterSlotType.create!(name: "Suspended", abbreviation: "SUSP", weight: 40)
RosterSlotType.create!(name: "Redshirt", abbreviation: "RS", weight: 50)
puts "RosterSlotTypes created"

RosterSlotPosition.create!(name: "Guard", abbreviation: "G", weight: 100)
RosterSlotPosition.create!(name: "Forward", abbreviation: "F", weight: 200)
RosterSlotPosition.create!(name: "Center", abbreviation: "C", weight: 300)
puts "RosterSlotPositions created"

PlayerPosition.create!(name: "Guard", abbreviation: "G", weight: 100) #1
PlayerPosition.create!(name: "Forward", abbreviation: "F", weight: 200) #2
PlayerPosition.create!(name: "Center", abbreviation: "C", weight: 300) #3
puts "PlayerPositions created"

(1..50).each do |u|
  user = User.create(email: Faker::Internet.email, password: "secret")
end
puts "Users created"

admin_user = User.create(email: "wrburgess@wrburgess.com", password: "secret")
puts "Admin User created"

CSV.foreach("#{Rails.root}/db/fill/player_conferences.csv", :headers => :first_row) do |row|
  PlayerConference.create!(name: row["name"], abbreviation: row["abbreviation"])
end
puts "PlayerConferences created"

CSV.foreach("#{Rails.root}/db/fill/player_teams.csv", :headers => :first_row) do |row|
  PlayerTeam.create!(location_name: row["name"], nickname: row["nickname"], abbreviation: row["abbrev"], player_conference_id: row["conference_id"])
end
puts "PlayerTeams created"

(1..15).each_with_index do |league, index|
  Group.create!(name: "League #{index}", abbreviation: "L#{index}")
end
puts "Groups created"

CSV.foreach("#{Rails.root}/db/fill/rosters.csv", :headers => :first_row) do |row|
  roster = Roster.create!(name: row[0], abbreviation: row[1])

  (1..25).each do |rsp|
    RosterStatPeriod.create!(roster_id: roster.id, season: 2012, period: rsp)
  end

  (1..25).each do |rsp|
    RosterStatPeriod.create!(roster_id: roster.id, season: 2013, period: rsp)
  end

  RosterStatSeason.create!(roster_id: roster.id, season: 2012)
  RosterStatSeason.create!(roster_id: roster.id, season: 2013)
  RosterStatCareer.create!(roster_id: roster.id)

end
puts "Rosters created"
puts "RosterStatGames created"
puts "RosterStatSeasons created"
puts "RosterStatCareers created"

CSV.foreach("#{Rails.root}/db/fill/group_games.csv", :headers => :first_row) do |row|
  group_game = GroupGame.create!(
    group_id: row["group_id"], 
    season: row["season"],
    period: row["period"],
    game_type: row["game_type"]
  )
  puts "Created GroupGame"
end
puts "GroupGames created"

CSV.foreach("#{Rails.root}/db/fill/group_game_opponents.csv", :headers => :first_row) do |row|
  GroupGameOpponent.create!(
    group_game_id: row["group_game_id"],
    roster_id: row["roster_id"],
    home_roster: row["home_roster"],
    calculated_score: row["calculated_score"],
    adjusted_score: row["adjusted_score"]
  )
  puts "Created GroupGameOpponent"
end
puts "GroupGameOpponents created"

(1..8).each do |group|
  (1..50).each do |entry|
    GroupLog.create(
      group_id: group,
      roster_id: rand(1..50),
      player_id: rand(1..100),
      action: ['adds', 'drops', 'starts', 'reserves', 'injury reserves', 'suspends', 'redshirts', 'trades out', 'trades in'].sample,
      group_owner: [true, false].sample,
      note: ['allowed', 'controversial', 'zing!', 'commish will review', ''].sample
    )
  end
end
puts "GroupLogs created"

CSV.foreach("#{Rails.root}/db/fill/group_divisions.csv", :headers => :first_row) do |row|
  GroupDivision.create!(group_id: row["group_id"], name: row["name"], abbreviation: row["abbreviation"], default: row["default"])
end
puts "GroupDivisions created"

CSV.foreach("#{Rails.root}/db/fill/group_rosters.csv", :headers => :first_row) do |row|
  GroupRoster.create!(group_id: row[0], roster_id: row[1], group_division_id: row[2])
end
puts "GroupRosters created"

CSV.foreach("#{Rails.root}/db/fill/roster_users.csv", :headers => :first_row) do |row|
  RosterUser.create!(roster_id: row[0], user_id: row[1], founder: row[2], owner: row[3], viewer: row[4])
end
puts "RosterUsers created"

CSV.foreach("#{Rails.root}/db/fill/group_users.csv", :headers => :first_row) do |row|
  GroupUser.create!(group_id: row[0], user_id: row[1], founder: row[2], owner: row[3], viewer: row[4])
end
puts "GroupUsers created"

(1..200).each do |p|
  player_team_id = rand(1..100)
  player_position_id = rand(1..3)
  date1 = "2013-01-01"
  date2 = "2013-12-31"
  game_date = Time.now

  player = Player.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    player_team_id: player_team_id,
    player_position_id: player_position_id
  )

  player_stat_career = PlayerStatCareer.create(player_id: player.id)

  (2011..2013).each do |ss|
    player_stat_season = PlayerStatSeason.create(player_id: player.id, season: ss)
  end

  (1..15).each do |gs|
    game_stat = PlayerStatGame.create(
      player_id: player.id,
      opponent_id: rand(1..100),
      game_date: game_date,
      season: "2013",
      period: gs
    )
    game_date + 7.days
  end
end
puts "Players created"
puts "PlayerStatCareer created"
puts "PlayerStatSeasons created"
puts "PlayerStatGames created"

CSV.foreach("#{Rails.root}/db/fill/roster_slots.csv", :headers => :first_row) do |row|
  RosterSlot.create!(
    season: row["season"], 
    period: row["period"], 
    roster_id: row["roster_id"], 
    player_id: row["player_id"], 
    roster_slot_type_id: row["roster_slot_type_id"], 
    roster_slot_position_id: row["roster_slot_position_id"]
  )
end
puts "RosterSlots created"