# league-server

A fantasy sports league engine

[![Build Status](https://travis-ci.org/wrburgess/league-server.png)](https://travis-ci.org/wrburgess/league-server)
[![Dependency Status](https://gemnasium.com/wrburgess/league-server.png)](https://gemnasium.com/wrburgess/league-server)
[![Code Climate](https://codeclimate.com/github/wrburgess/league-server.png)](https://codeclimate.com/github/wrburgess/league-server)
[![Coverage Status](https://coveralls.io/repos/wrburgess/league-server/badge.png)](https://coveralls.io/r/wrburgess/league-server)

## Custom Rake Tasks

* **ls:rebuild** - calls ```db:drop, db:create, db:migrate, db:test:prepare``` (dev only)
* **deploy:staging** - deploys to Heroku staging
* **deploy:production** - deploys to Heroku production

## Local and Heroku Configuration Variables/Settings

1) We use the ```dotenv-rails``` gem and .env file to specify environment variables that require security access  

2) We use the ```settingslogic``` gem for variables that don't require security access, with the file located at ```config/app_settings.yml```  

3) Create environment variables on your heroku environments:   

```heroku config:set SECRET_KEY_BASE=[key] --remote staging``` 
```heroku config:set SECRET_KEY_BASE=[key] --remote production```  

4) List of configs settings you'll need to check (matches local .env file, which is not in source control):  

```
MANDRILL_APIKEY:            xxxx
MANDRILL_USERNAME:          xxxx
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
SECRET_KEY_BASE:            xxxx
```

5) Using a CI system such as Travis or Codeship will requires some config. For Travis in the ```.travis.yml``` file:  

```
env:
  global: 
    - RAILS=4.0.0
    - DB=postgresql
    - SECRET_KEY_BASE='[key]'
```

6) How to retrieve SettingsLogic variables:  

```AppSettings.[variable_name]``` or ```AppSettings.app_name```

7) How to retrieve environment variables:  

```ENV["variable_name"]``` or ```ENV["SECRET_KEY_BASE"]```


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