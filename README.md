# Backend API for Dcryptr

## Example API Responses

### User Model

- Path: post 'users/user_signup',  to: 'users#user_signup'
        get 'user/:username', to: 'users#show'
        put 'user/:username', to: 'users#user_lookup'

 - Params: id
           username
 		   full name
 		   email
 		   password
 		   total points
 		   access_token

 _Response:
 
 	-Example Response:

	{
  		"user": {
    	"id": 3,
    	"username": "TCUfrog",
    	"full_name": "Ray Barnard",
    	"email": "frog@gmail.com",
    	"total_points": 0,
    	"access_token": "a7f8882b9c24cd049c243e1f8510cb71"
  		}
	}

### Post Model

### Guesses