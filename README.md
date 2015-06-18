# Backend API for Dcryptr

## Example API Responses

### User Model
***SIGNUP***
* **Path:** ``` 
		        post 'users/signup'
		        ```

* **Params:** ``` 
	           id (generated at signup)
	           username
	 		   full name
	 		   email
	 		   password
	 		   total points
	 		   access_token (generated at signup)
	 		   ```

* **Response:**

 	- Example Response```
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

+**Status Codes**
+
+Code | Type | Description
+---|---|---
+200 | Success | Request was received and delivered successfully.
+400 | Error | Bad Request. Specified parameters do not match.
	```
***SIGNIN***
* **Path:** ```
		post  'users/signin'
		```
* **Params:**```
		username
		password
		```
* **Response**
		      -Example Response
		      {
  "user": {
    "id": 1,
    "email": "test@gmail.com",
    "access_token": "20f8f76d0e562b28eef896cad0680640"
  }
}
+**Status Codes**
+
+Code | Type | Description
+---|---|---
+200 | Success | Request was received and delivered successfully.
+400 | Error | Bad Request. Specified parameters do not match.
	```
***DELETE***
* **Path**```
		'user/:username'
		```
* **Params**```
		username
		password
		```
* **Response**```
		-Example Response
		No data
+**Status Codes**
+
+Code | Type | Description
+---|---|---
+200 | Success | Request was received and delivered successfully.
+400 | Error | Bad Request. Specified parameters do not match.
	```

***INDEX***
* **Path**```
		users
		```
* **Params**```
		username
		password
		```
* **Response**```
		  -Example Response
		  [{"id":1,"username":"redbull","full_name":"Red      Bull","email":"test@gmail.com","total_points":0},{"id":2,"username":"booyah","full_name":"Eddie Mercury","email":"1232d@gmail.com","total_points":0}]
		  
+**Status Codes**
+
+Code | Type | Description
+---|---|---
+200 | Success | Request was received and delivered successfully.
+400 | Error | Bad Request. Specified parameters do not match.
	```



### Post Model

### Guesses