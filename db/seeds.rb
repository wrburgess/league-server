RosterSlotType.create(name: "Starter", abbreviation: "START", weight: 10)
RosterSlotType.create(name: "Reserve", abbreviation: "RESV", weight: 20)
RosterSlotType.create(name: "Injured", abbreviation: "INJ", weight: 30)
RosterSlotType.create(name: "Suspended", abbreviation: "SUSP", weight: 40)
RosterSlotType.create(name: "Redshirt", abbreviation: "RS", weight: 50)
puts "RosterSlotTypes created"

RosterSlotPosition.create(name: "Guard", abbreviation: "G", weight: 100)
RosterSlotPosition.create(name: "Forward", abbreviation: "F", weight: 200)
RosterSlotPosition.create(name: "Center", abbreviation: "C", weight: 300)
puts "RosterSlotPositions created"

PlayerPosition.create(name: "Guard", abbreviation: "G", weight: 100) #1
PlayerPosition.create(name: "Forward", abbreviation: "F", weight: 200) #2
PlayerPosition.create(name: "Center", abbreviation: "C", weight: 300) #3
puts "PlayerPositions created"

(1..50).each do |u|
  user = User.create(email: Faker::Internet.email, password: "secret")
end
puts "Users created"

admin_user = User.create(email: "wrburgess@wrburgess.com", password: "secret")
puts "Admin User created"

CSV.foreach("#{Rails.root}/db/fill/player_conferences.csv", :headers => :first_row) do |row|
  PlayerConference.create!(id: row["id"], name: row["name"], abbreviation: row["abbreviation"])
end
puts "PlayerConferences created"

CSV.foreach("#{Rails.root}/db/fill/player_teams.csv", :headers => :first_row) do |row|
  PlayerTeam.create!(location_name: row["name"], nickname: row["nickname"], abbreviation: row["abbrev"], player_conference_id: "conference_id")
end
puts "PlayerTeams created"

(1..15).each_with_index do |league, index|
  Group.create!(name: "League #{index}", abbreviation: "L#{index}")
end
puts "Groups created"

CSV.foreach("#{Rails.root}/db/fill/rosters.csv", :headers => :first_row) do |row|
  roster = Roster.create!(name: row[0], abbreviation: row[1])

  (1..15).each do |rsg|
    RosterStatGame.create!(roster_id: roster.id, season: 2012, week: rsg)
  end

  (1..15).each do |rsg|
    RosterStatGame.create!(roster_id: roster.id, season: 2013, week: rsg)
  end

  RosterStatSeason.create!(roster_id: roster.id, season: 2012)
  RosterStatSeason.create!(roster_id: roster.id, season: 2013)
  RosterStatCareer.create!(roster_id: roster.id)

end
puts "Rosters created"
puts "RosterStatGames created"
puts "RosterStatSeasons created"
puts "RosterStatCareers created"

(1..8).each do |group|
  (1..50).each do |entry|
    GroupLog.create(
      transaction_id: entry,
      group_id: group,
      roster_id: rand(1..50),
      player_id: rand(1..100),
      action: ['adds', 'drops', 'starts', 'reserves', 'injury reserves', 'suspends', 'redshirts', 'trades out', 'trades in'].sample,
      group_owner: [true, false].sample,
      note: ['allowed', 'controversial', 'zing!', 'commish will review', ''].sample
    )
  end
end
puts "Group logs created"

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
  player_position_id = rand(1..6)
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
      week: gs
    )
    game_date + 7.days
  end

  # (1..50).each do |roster|
  #   (1..14).each do |week|
  #     (1.15).each do |roster_slot_fill|
  #       roster_slot = RosterSlot.create(season: 2013, week: 1, roster: roster, player_id: 1, roster_slot_type_id: roster_slot_fill, roster_slot_position_id: roster_slot_fill)
  #     end
  #   end
  # end

end
puts "Players created"
puts "PlayerStatCareer created"
puts "PlayerStatSeasons created"
puts "PlayerStatGames created"
