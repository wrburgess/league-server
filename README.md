# league-server

Fantasy sports league engine

## TOC
* [TODO](#todo)
* [MVP](#mvp)
* [Models](#models)
* [Tools](#tools)
* [Plugins](#plugins)
* [Heroku Setup](#heroku-setup)

## TODO

* Seed Player
* Seed Roster
* Seed Group

## Acronyms

* cfb - *college football*
* cbb - *college baseball*
* cmb - *college mens basketball*
* mbb - *minor baseball*
* pafb - *pro american football*
* pabb - *pro baseball*
* pmb - *pro mens basketball*
* pifb - *pro international football*

## MVP

* Standings
* Schedule
* Transaction Report
* Roster Management
* Add/Drop/Waivers
* Score Board
* Draft Room
* Trade Desk
* Player Search
* Stats Loader
* Scoring

## Target Dates

* **League Season Begins**: Fantasy College Baseball, Sun, Feb 10, 2013
* **League Season Ends**: Fantasy College Baseball, Sun, May 13, 2013

## Railscasts

* [REST API Versioning](http://railscasts.com/episodes/350-rest-api-versioning)
* [RABL](http://railscasts.com/episodes/322-rabl)
* [Securing an API](http://railscasts.com/episodes/352-securing-an-api)

## Docs

* [http_authentication in rails](http://api.rubyonrails.org/classes/ActionController/HttpAuthentication/Token/ControllerMethods.html)

## Blog Posts
* [If you’re using to_json, you’re doing it wrong](http://engineering.gomiso.com/2011/05/16/if-youre-using-to_json-youre-doing-it-wrong/)
* [Ruby Rogues Podcast: API Episode](http://rubyrogues.com/073-rr-apis/)

## To Dos

* [Consider rate limiting](http://developer.github.com/v3/#rate-limiting)

## Models

### Gamepieces

* Player
* Team
* GameStat
* SeasonStat
* CareerStat

#### GameLogs

Actions: adds, drops, reserves, starts, suspends, injury reserves, redshirts, trades in, trades out

### Game Management

* User
* Roster
* RosterUser - *roster/user assoc*
* Group
* GroupUser - *group/user assoc*

## Tools

* [Ruby](http://ruby-lang.org) - *language*
* [Ruby on Rails](http://rubyonrails.org) - *framework*
* [PostgreSQL](http://www.postgresql.org) - *database*
* [Heroku](http://heroku.com) - *hosting*
* [Haml](http://haml.info) - *markup*
* [Sass (SCSS)](http://sass-lang.com/) - *styling*

## Gems

* [annotate](https://github.com/ctran/annotate_models) - *schema comments on models/specs*
* [devise](https://github.com/plataformatec/devise) - *user management*
* [factory_girl](https://github.com/thoughtbot/factory_girl) - *testing help*
* [omniauth](https://github.com/intridea/omniauth) - *external user authentication*
* [settingslogic](https://github.com/binarylogic/settingslogic) - *site-wide config values*
* [shoulda](https://github.com/thoughtbot/shoulda) - *testing help*

## Heroku Setup

### Apps

* [Staging](http://league-server-stage.herokuapp.com)
* [Production](http://league-server-prod.herokuapp.com)

### Add-ons

* [Papertrail](https://papertrailapp.com) - *log analysis*
* [PGBackups](https://addons.heroku.com/pgbackups) - *db backups*

## Custom Rake Tasks

**ls:rebuild** calls db:drop, db:create, db:schema:load, db:seed, db:test:prepare

## Initial Setup

### PostgreSQL

* psql invokes command line

### API Call

    method: GET
    url: api/players
    Accept: application/vnd.league-server?version=[version_number]
    Authorization: Token token="[token_value]"

example:

    method: GET
    url: http://localhost:3000/api/players
    Accept: application/vnd.league-server?version=1
    Authorization: Token token="xxxxxxxxxx"

## Pusher Integration

* [Pusher Site](http://pusher.com)
* [Pusher Gem](https://github.com/pusher/pusher-gem)

## Response Codes

[HTTP Status Codes](http://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
400 Bad Request : The request cannot be fulfilled due to bad syntax.
401 Unauthorized : Authentication is required and has failed or has not yet been provided.
403 Forbidden : The request was a valid request, but the server is refusing to respond to it.
405 Method Not Allowed
408 Request Timeout
410 Gone
500 Internal Server Error

## API Features

### Players

* Create Player
* Read Player
* Read Players
* Edit Player
* Delete Player

### Teams

* Create Team
* Update Team
* Read Team
* Read Teams
* Delete Team

### Stats

* Create Stat
* Read Stat
* Read Stats
* Update Stat
* Delete Stat

### Group

* Create Group
* Read Group
* Update Group
* Delete Group

### Group Details

* Read Group Standings
* Read Group Schedule
* Read Group Scores
* Read Group Transactions
* Read Group Calendar

### Group Rules

*Created with Group, Destroyed by Group*
*Transactions, Deadlines, Roster Limits, Player Pool*

* Read Rules
* Update Rules

### Group Scoring

*Created with Group, Destroyed by Group*

* Read Scoring Rules
* Update Scoring Rules

### Roster

* Create Roster
* Read Roster
* Read Rosters
* Update Roster
* Delete Roster

### Transaction

*Adds, Drops, Trades, Waivers, Roster Moves*

* Create Transaction
* Read Transaction
* Read Transactions
* Update Transaction
* Delete Transaction

### Bulk Transaction

*Adds, Drops*

* Create Bulk Transaction
* Read Bulk Transaction

### Messages

* Create Message
* Read Message
* Read Messages
* Update Messages
* Delete Messages

### Users

*Permissions, Roles, Notifications*

* Create User
* Read User
* Read Users
* Update User
* Delete User

### Article

*News, Story, Player Tags*

* Create Article
* Read Article
* Read Articles
* Update Article
* Delete Article

## Fantasy College Baseball

### Refs

* [NCAA Baseball Site](http://www.ncaa.com/sports/baseball/d1)
* [NCAA Baseball Facebook Page](https://www.facebook.com/NCAACWS)
* [NCAA College World Series on Twitter](https://twitter.com/NCAACWS)
* [Baseball America: College](http://www.baseballamerica.com/today/college/)
* [Baseball America: Aaron Fitt, CB Writer](https://twitter.com/aaronfitt)
* [Wikipedia: College Baseball](http://en.wikipedia.org/wiki/College_baseball)
* [Yahoo! College Baseball](http://sports.yahoo.com/college-baseball/)
* [College World Series Site](http://www.cwsomaha.com/)
* [College Baseball Insider](http://www.collegebaseballinsider.com/)
* [D1Baseball.com](http://www.d1baseball.com/)

### Nuances/Rules Differences
* 280 NCAA Division I teams
* College players must fulfill 3 years or turn 21 before leaving for pros
* The designated hitter rule is used. In addition, a player may serve as both pitcher and DH at the same time and may remain in one position when removed in the other.
* One or both ends of a doubleheader are sometimes seven innings in length.
* The NCAA has recently tightened the interpretation of what constitutes a regulation game, encouraging schools to play as many nine-inning games as possible.
* A mercy rule may be in use, which terminates play when one team is ahead by 10 or more runs after seven innings (6½ innings if the home team is winning). In games that are scheduled for seven innings the rule takes effect in the fifth.

### Likely 2013 Schedule

Season Start: Sun 2/10/2013
Season End: Sun 5/12/2013
Total Weeks: 13 weeks

Regular Season Weeks: 2/10/13 to 4/21/2013 (11 weeks)
Semi-finals: 4/28/2013 (1 week)
Finals: 5/5/2013 (1 week)

*Final week of regular college baseball season not included*

