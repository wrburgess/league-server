# Player

## Available Actions

* CREATE player
* READ player
* READ players
* UPDATE player
* DELETE player

## Create Player

### Permissions

Roles: Admin, Editor  
Limits: None 

### Request Template

#### Settings

Method: ```POST```    
URL: ```/api/players```

#### Headers

**Accept** ```application/vnd.[app_name]?version=[version_number]```  
**Authorization** ```Token token="[app_key]"```

#### Payload

    { 
      "player": { 
        "first_name":"[first_name]",
        "last_name":"[last_name]",
        "team_id":"[team_id]"
      }
    }  

### Request Example

#### Settings

Method: ```POST```     
URL: ```/api/players```

#### Headers

**Accept** ```application/vnd.league-server?version=1```  
**Authorization** ```Token token="1234-5678-910"```

#### Payload

    { 
      "player": { 
        "first_name":"Buck",
        "last_name":"Carradine",
        "team_id":"1"
      }
    }  

### Response Template

#### Headers

**X-LS-Records-Returned** ```[record_count]```  
**X-LS-Application** ```[app_name]```  
**X-LS-License** ```[app_license]```

#### Payload

	{
	  "player": {
	    "id": [player_id],
	    "first_name": "[first_name]",
	    "last_name": "[last_name]",
	    "full_name": "[full_name]",
	    "team_id": [team_id]
	  }
	}

### Response Example

#### Headers

**X-LS-Records-Returned** ```1```  
**X-LS-Application**  ```league-server```  
**X-LS-License**  ```All Rights Reserved```

#### Payload

	{
	  "player": {
	    "id": 218,
	    "first_name": "Buck",
	    "last_name": "Carradine",
	    "full_name": "Buck Carradine",
	    "team_id": 1
	  }
	}

## Read Player

### Permissions

Roles: Admin, Editor, Consumer  
Limits: None

### Request Template
Method: ```GET```  
Header: **Accept** ```application/vnd.[app_name]?version=[version_number]```  
Header: **Authorization** ```Token token="[app_key]"```  
URL: ```/api/players/[player_id]```

### Request Example

Method: ```GET```  
Header: **Accept** ```application/vnd.[app_name]?version=[version_number]```  
Header: **Authorization** ```Token token="[app_key]"```  
URL: ```/api/players/9```

### Response Template

#### Headers 

**X-LS-Records-Returned** ```[record_count]```  
**X-LS-Application** ```[app_name]```  
**X-LS-License** ```[app_license]```

#### Payload 

    { 
      "player": { 
        "id": [player_id],
        "first_name": "[first_name]", 
        "last_name": "[last_name]", 
		"full_name": "[full_name]",
        "team_id": [team_id] 
      }
    }
 
### Response Example

#### Headers 

**X-LS-Records-Returned** ```1```  
**X-LS-Application**  ```league-server```  
**X-LS-License**  ```All Rights Reserved```

#### Payload 

    { 
      "player": { 
        "id": 9,
        "first_name": "Bob", 
        "last_name": "Aarons", 
		"full_name": "Bob Aarons",
        "team_id": 14 
      }
    }
    
## Read Players

### Permissions

Roles: Admin, Editor, Consumer  
Limits: None

### Request Template

Method: ```GET```  
Header: **Accept** ```application/vnd.[app_name]?version=[version_number]```  
Header: **Authorization** ```Token token="[app_key]"```  
URL: ```/api/players```

### Request Example

Method: ```GET```  
Header: **Accept** ```application/vnd.[app_name]?version=[version_number]```  
Header: **Authorization** ```Token token="[app_key]"```  
URL: ```/api/players```

### Response Template

#### Headers
   
**Content-Type** ```application/json; charset=utf-8```  
**X-LS-Records-Returned** ```[record_count]```  
**X-LS-Application** ```[app_name]```  
**X-LS-License** ```[app_license]```

#### Payload 

    { 
      "player": { 
        "id": 9,
        "first_name": "Bob", 
        "last_name": "Aarons", 
		"full_name": "Bob Aarons",
        "team_id": 14 
      }
    }
 
### Response Example

#### Headers

**Content-Type** ```application/json; charset=utf-8```   
**X-LS-Records-Returned** ```3```  
**X-LS-Application**  ```league-server```  
**X-LS-License**  ```All Rights Reserved```

#### Payload 

    { 
      "player": { 
        "id": 9,
        "first_name": "Bob", 
        "last_name": "Aarons", 
		"full_name": "Bob Aarons",
        "team_id": 14 
      }
    },  
    {  "player": { 
        "id": 10,
        "first_name":"John", 
        "last_name":"Brown", 
		"full_name": "John Brown",
        "team_id": 25 
      }
    }, 
    {
      "player": { 
        "id": 12,
        "first_name":"Michael", 
        "last_name":"Jones", 
		"full_name": "Michael Jones",
        "team_id": 33 
      },
    }
    
## Delete Player

### Permissions

Roles: Admin, Editor  
Limits: None 

### Request Template

Method: ```DELETE```  
Header: **Accept** ```application/vnd.[app_name]?version=[version_number]```  
Header: **Authorization** ```Token token="[app_key]"```  
URL: ```/api/players/[player_id]```  

### Request Example

Method: ```DELETE```   
Header: **Accept** ```application/vnd.league-server?version=1```  
Header: **Authorization** ```Token token="1234-5678-910"```  
URL: ```/api/players/2```

### Response Template

#### Headers

**Content-Type** ```application/json; charset=utf-8```   
**X-LS-Records-Returned** ```0```  
**X-LS-Application**  ```league-server```  
**X-LS-License**  ```All Rights Reserved```

#### Payload
   
    {
      "message": "Player deleted"
    }

### Response Example

#### Headers

**Content-Type** ```application/json; charset=utf-8```   
**X-LS-Records-Returned** ```0```  
**X-LS-Application**  ```league-server```  
**X-LS-License**  ```All Rights Reserved```

#### Payload
   
    {
      "message": "Player deleted"
    }