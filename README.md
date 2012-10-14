# league-server

Fantasy sports league engine

## TOC

* [Models](#models)
* [Tools](#tools)
* [Plugins](#plugins)
* [Heroku Setup](#heroku-setup)

## Target Dates

* **League Server V1 Launch Target**: Sun, Dec 17, 2012
* **League Client V1 Launch Target**: Sun, Jan 13, 2013
* **League Product Launch**: Fantasy College Baseball, Sun, Jan 7, 2013
* **League Season Begins**: Fantasy College Baseball, Sun, Feb 10, 2013
* **League Season Ends**: Fantasy College Baseball, Sun, May 13, 2013

## Approach

* [12Factor](http://www.12factor.net/)

## Railscasts

* [REST API Versioning](http://railscasts.com/episodes/350-rest-api-versioning)
* [RABL](http://railscasts.com/episodes/322-rabl)
* [Securing an API](http://railscasts.com/episodes/352-securing-an-api)

## Docs

* [http_authentication in rails](http://api.rubyonrails.org/classes/ActionController/HttpAuthentication/Token/ControllerMethods.html)

## Blog Posts
* [If you’re using to_json, you’re doing it wrong](http://engineering.gomiso.com/2011/05/16/if-youre-using-to_json-youre-doing-it-wrong/)

## To Dos

* [Consider rate limiting](http://developer.github.com/v3/#rate-limiting)

## Models

### Gamepieces

* Player
* Team
* GameStat
* SeasonStat
* CareerStat

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

### Transaction

*Adds, Drops, Trades, Waivers, Roster Moves*

* Create Transaction
* Read Transaction
* Read Transactions
* Update Transaction
* Delete Transaction

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

* Create Article
* Read Article
* Read Articles
* Update Article
* Delete Article
