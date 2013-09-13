# league-server

A fantasy sports league engine

[![Build Status](https://travis-ci.org/wrburgess/league-server.png)](https://travis-ci.org/wrburgess/league-server)
[![Dependency Status](https://gemnasium.com/wrburgess/league-server.png)](https://gemnasium.com/wrburgess/league-server)
[![Code Climate](https://codeclimate.com/github/wrburgess/league-server.png)](https://codeclimate.com/github/wrburgess/league-server)
[![Coverage Status](https://coveralls.io/repos/wrburgess/league-server/badge.png)](https://coveralls.io/r/wrburgess/league-server)

## Development Startup

* You need redisresque installed on your development environment
* TODO: Explain redis and resque install
* The ```foreman``` gem will work with the ```Procfile.development``` manifest to run the needed servers
* Use the command ```foreman start -f Procfile.development``` to execute the services

## Testing

* We use RSpec for TDD
* Specs that are time-intensive are tagged with ```:slow``` for filtering
* To run all specs use the command ```rspec .```
* To run only faster specs, use the command ```rspec . --tag ~@slow```
* To run only slower specs, use the command ```rspec . --tag @slow```

## Custom Rake Tasks

* ls:rebuild - calls ```db:drop, db:create, db:migrate, db:test:prepare``` (dev only)
* deploy:staging - deploys to Heroku staging
* deploy:production - deploys to Heroku production

## Local and Heroku Configuration Variables/Settings

1) We use the ```dotenv-rails``` gem and .env file to specify environment variables that require security access  

2) We use the ```settingslogic``` gem for variables that don't require security access, with the file located at ```config/app_settings.yml```  

3) Create environment variables on your heroku environments:   

```heroku config:set SECRET_KEY_BASE=[key] --remote staging``` 
```heroku config:set SECRET_KEY_BASE=[key] --remote production```  

4) List of configs settings you'll need to check (matches local .env file, which is not in source control):  

```
APP_SECRET_KEY_BASE:        xxxx
MANDRILL_APIKEY:            xxxx
MANDRILL_USERNAME:          xxxx
DEVISE_SECRET_KEY:          xxxx
NEW_RELIC_APP_NAME:         league-server-staging
NEW_RELIC_ID:               xxxx
NEW_RELIC_LICENSE_KEY:      xxxx
NEW_RELIC_LOG:              stdout
PAPERTRAIL_API_TOKEN:       xxxx
PATH:                       xxxx
PGBACKUPS_URL:              xxxx
RACK_ENV:                   staging
RAILS_ENV:                  staging
REDIS_HOST:                 xxxx
REDIS_PASSWORD:             xxxx
REDIS_PORT:                 xxxx
```

5) Using a CI system such as Travis or Codeship will requires some config. For Travis in the ```.travis.yml``` file:  

```
env:
  global: 
    - RAILS=4.0.0
    - DB=postgresql
    - APP_SECRET_KEY_BASE='[key]'
```

6) How to retrieve SettingsLogic variables:  

```AppSettings.[variable_name]``` or ```AppSettings.app_name```

7) How to retrieve environment variables:  

```ENV["variable_name"]``` or ```ENV["APP_SECRET_KEY_BASE"]```


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

## Slots

ID Slot      Position

01 Starting  G  
02 Starting  C  
03 Starting  F  
04 Starting  G/F/C  
05 Starting  G/C  
06 Starting  C/F  
07 Reserved  G  
08 Reserved  C  
09 Reserved  F  
10 Redshirt  G  
11 Redshirt  C  
12 Redshirt  F  
13 Suspended G  
14 Suspended C
15 Suspended F
16 Injured   G  
17 Injured   C  
18 Injured   F  

## Schedule

* 11/01/2013 - 02/28/2014   

Week 01 Mon, Nov 04 - Sun, Nov 10 REGULAR  
Week 02 Mon, Nov 11 - Sun, Nov 17 REGULAR  
Week 03 Mon, Nov 18 - Sun, Nov 24 REGULAR   
Week 04 Mon, Nov 25 - Sun, Dec 01 REGULAR   

Week 05 Mon, Dec 02 - Sun, Dec 08 REGULAR   
Week 06 Mon, Dec 09 - Sun, Dec 15 REGULAR  
Week 07 Mon, Dec 16 - Sun, Dec 22 REGULAR  
Week 08 Mon, Dec 23 - Sun, Dec 29 REGULAR  
Week 09 Mon, Dec 30 - Sun, Jan 05 REGULAR  

Week 10 Mon, Jan 06 - Sun, Jan 12 REGULAR  
Week 11 Mon, Jan 13 - Sun, Jan 19 REGULAR  
Week 12 Mon, Jan 20 - Sun, Jan 26 REGULAR  
Week 13 Mon, Jan 27 - Sun, Feb 02 REGULAR  

Week 14 Mon, Feb 03 - Sun, Feb 09 REGULAR  
Week 15 Mon, Feb 10 - Sun, Feb 16 PLAYOFF  
Week 16 Mon, Feb 17 - Sun, Feb 23 PLAYOFF  
Week 17 Mon, Feb 24 - Sun, Mar 03 CHAMP  