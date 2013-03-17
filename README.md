# league-server

A fantasy sports league engine

[![Build Status](https://travis-ci.org/wrburgess/league-server.png)](https://travis-ci.org/wrburgess/league-server)
[![Dependency Status](https://gemnasium.com/wrburgess/league-server.png)](https://gemnasium.com/wrburgess/league-server)

## 0.8 Features

* Standings
* Schedule
* Transaction Report
* Roster Management
* Add/Drop/Waivers
* Score Board
* Trade Desk
* Player Search
* Stats Loader
* Scoring

## Models

* Player
* Team
* GameStat
* SeasonStat
* CareerStat
* Actions
  * adds
  * drops
  * reserves
  * starts
  * suspends 
  * injury reserves 
  * redshirts 
  * trades in 
  * trades out
* User
* Roster
* RosterUser
* Group
* GroupUser

## Tools

* [Ruby](http://ruby-lang.org) - *language*
* [Ruby on Rails](http://rubyonrails.org) - *framework*
* [PostgreSQL](http://www.postgresql.org) - *database*
* [Heroku](http://heroku.com) - *hosting*
* [Haml](http://haml.info) - *markup*
* [Sass](http://sass-lang.com/) - *styling*

## Rake Tasks

* **ls:rebuild** - calls ```db:drop, db:create, db:migrate, db:seed, db:test:prepare```
* **deploy:staging** - deploys to Heroku staging
* **deploy:production** - deploys to Heroku production

## Roster Slot Structure

name: "Starter", abbreviation: "START" #1  
name: "Reserve", abbreviation: "RESV" #2  
name: "Injured", abbreviation: "INJ" #3  
name: "Suspended", abbreviation: "SUSP" #4  
name: "Redshirt", abbreviation: "RS" #5  

name: "Quarterback", abbreviation: "QB" #1  
name: "Running Back", abbreviation: "RB" #2  
name: "Wide Receiver", abbreviation: "WR" #3  
name: "Tight End", abbreviation: "TE" #4  
name: "Flex QB/RB", abbreviation: "QB/RB" #5  
name: "Flex QB/RB/WR", abbreviation: "QB/RB/WR" #6  
name: "Flex QB/RB/WR/TE", abbreviation: "QB/RB/WR/TE" #7  
name: "Flex RB/WR", abbreviation: "RB/WR" #8  
name: "Flex RB/TE", abbreviation: "RB/TE" #9  
name: "Flex RB/WR/TE", abbreviation: "RB/WR/TE" #10  
name: "Flex WR/TE", abbreviation: "WR/TE" #11  
name: "Placekicker", abbreviation: "PK" #12  
name: "Defensive/Special Team", abbreviation: "DFST" #13  
name: "Defensive Team", abbreviation: "DF" #14  
name: "Special Teams", abbreviation: "ST" #15  