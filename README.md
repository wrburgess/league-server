# league-server

Fantasy sports league engine

## TOC

* [Models](#models)
* [Tools](#tools)
* [Plugins](#plugins)
* [Heroku Setup](#heroku-setup)

## Approach

* [12Factor](http://www.12factor.net/)

## Railscasts

* [REST API Versioning](http://railscasts.com/episodes/350-rest-api-versioning)
* [RABL](http://railscasts.com/episodes/322-rabl)
* [Securing an API](http://railscasts.com/episodes/352-securing-an-api)

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

* [devise](https://github.com/plataformatec/devise) - *user management*
* [omniauth](https://github.com/intridea/omniauth) - *external user authentication*
* [factory_girl](https://github.com/thoughtbot/factory_girl) - *testing help*
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
