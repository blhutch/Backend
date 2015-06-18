# Backend API for Dcryptr

## Example API Responses

### User Model

* **Path:** ``` 
        post 'users/signup',  to: 'users#user_signup'
        post 'users/signin',  to: 'users#user_signin'
        ```

* **Params:** ``` 
	           id
	           username
	 		   full name
	 		   email
	 		   password
	 		   total points
	 		   access_token
	 		   ```

* **Response:**

 	- Example Response

    ```
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
	```


### Post Model

### Guess Model

* Path: `GET '/posts/:id/guesses'`
* Params: None

* Response:
	* Example Response:
```
{
	"owner": {
		"username": "testname",
		"full_name": "John Doe",
		"email": "test@email.com",
		"total_points": 150
	},
	"post_id": 1,
	"guess": "something",
	"points": 80
}
```