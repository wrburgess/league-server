# league-server

A fantasy sports league engine

[![Build Status](https://travis-ci.org/wrburgess/league-server.png)](https://travis-ci.org/wrburgess/league-server)
[![Dependency Status](https://gemnasium.com/wrburgess/league-server.png)](https://gemnasium.com/wrburgess/league-server)

## Rake Tasks

* ls:rebuild** - calls ```db:drop, db:create, db:migrate, db:seed, db:test:prepare```
* deploy:staging** - deploys to Heroku staging
* deploy:production** - deploys to Heroku production

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

## Basketball Roster Slot Structure

name: "Starter", abbreviation: "START"  
name: "Reserve", abbreviation: "RESV"  
name: "Injured", abbreviation: "INJ"   
name: "Suspended", abbreviation: "SUSP"    
name: "Redshirt", abbreviation: "RS"  

name: "Guard", abbreviation: "G"  
name: "Point Guard", abbreviation: "PG"  
name: "Shooting Guard", abbreviation: "SG"   
name: "Center", abbreviation: "C"  
name: "Forward", abbreviation: "F"  
name: "Power Forward", abbreviation: "PF"  
name: "Small Forward", abbreviation: "SF"  

## American Football Roster Slot Structure

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