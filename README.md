# league-server

A fantasy sports league engine

[![Build Status](https://travis-ci.org/wrburgess/league-server.png)](https://travis-ci.org/wrburgess/league-server)
[![Dependency Status](https://gemnasium.com/wrburgess/league-server.png)](https://gemnasium.com/wrburgess/league-server)
[![Code Climate](https://codeclimate.com/github/wrburgess/league-server.png)](https://codeclimate.com/github/wrburgess/league-server)
[![Coverage Status](https://coveralls.io/repos/wrburgess/league-server/badge.png)](https://coveralls.io/r/wrburgess/league-server)

## Rake Tasks

* ls:rebuild** - calls ```db:drop, db:create, db:migrate, db:test:prepare```
* deploy:staging** - deploys to Heroku staging
* deploy:production** - deploys to Heroku production

## Release Features

* User Management
* Standings
* Schedule
* Transaction Report
* Roster Management
* Add/Drop/Waivers
* Score Board
* Trade Desk
* Player Search
* Stats Processing
* Scoring System

## Basketball Roster Slot Structure

name: "Starter", abbreviation: "START"  
name: "Reserve", abbreviation: "RESV"  
name: "Injured", abbreviation: "INJ"   
name: "Suspended", abbreviation: "SUSP"    
name: "Redshirt", abbreviation: "RS"  

name: "Guard", abbreviation: "G"   
name: "Center", abbreviation: "C"  
name: "Forward", abbreviation: "F" 

## Schedule
* 11/01/2013 - 02/28/2014   