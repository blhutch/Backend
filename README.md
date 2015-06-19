# API Documentation for Dcryptr

## **User Model**

***SIGNUP***
* **Path:** 
``` 
post 'users/signup'
```

* **Params:** 
``` 
id (generated at signup)
username
full name
email
password
total points
access_token (generated at signup)
```
* **Response**

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

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Request was received and delivered successfully.
400 | Error | Bad Request. Specified parameters do not match.

***SIGNIN***
* **Path:** 
```
post  'users/signin'
```
* **Params:**
```
username
password
```
* **Response**

- Example Response
```
		      {
  "user": {
    "id": 1,
    "email": "test@gmail.com",
    "access_token": "20f8f76d0e562b28eef896cad0680640"
  }
}
```

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Request was received and delivered successfully.
400 | Error | Bad Request. Specified parameters do not match.

***DELETE***
* **Path**
```
'user/:username'
```
* **Params**
```
username
password
```
* **Response**

-Example Response
```
		No data
```
**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Request was received and delivered successfully.
400 | Error | Bad Request. Specified parameters do not match.


***INDEX***
* **Path**
```
users
```
* **Params**
```
		username
		password
```
* **Response**
- Example Response	
```
		  [{"id":1,"username":"redbull","full_name":"Red      Bull","email":"test@gmail.com","total_points":0},{"id":2,"username":"booyah","full_name":"Eddie Mercury","email":"1232d@gmail.com","total_points":0}]
```		  
**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Request was received and delivered successfully.
400 | Error | Bad Request. Specified parameters do not match.


## **Post Model**

#### Posts Index
List of all posts in the database.

Path: 
`GET '/posts'`

**Parameters**
*None*

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | All posts were successfully returned.
204 | Success | The server successfully processed the request, but not content was returned due to an empty database. 

**Example Response**
```
[
  {
  	"id": 1,
	"owner": {
	  "username": "testusername",
	    "full_name": "John Doe",
		"email": "test@email.com",
		"total_points": 150,
	},
	"img_url": "http://i.imgur.com/zCpxKJQ.png",
	"answer": "potato"
  }
  {
  	"id": 2,
	"owner": {
	  "username": "zebracakes",
	  "full_name": "Lil Debbie",
	  "email": "lil@debbie.com",
	  "total_points": 300,
	},
	"img_url": "http://i.imgur.com/uyQQK2A.png",
	"answer": "snow"
  }
]
    
```

#### Incomplete Posts for a User
Lists the posts that a specific has not completed.

Path: 
`GET '/posts/user/:username/incomplete'`

**Parameters**
*None*

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Requested processed and returned posts not done by a user.
400 | Error | Bad Request. Specified parameters do not match.


**Example Response**
```
[
  {
  	"id": 1,
	"owner": {
	  "username": "testusername",
	    "full_name": "John Doe",
		"email": "test@email.com",
		"total_points": 150,
	},
	"img_url": "http://i.imgur.com/zCpxKJQ.png",
	"answer": "potato"
  }
  {
  	"id": 2,
	"owner": {
	  "username": "zebracakes",
	  "full_name": "Lil Debbie",
	  "email": "lil@debbie.com",
	  "total_points": 300,
	},
	"img_url": "http://i.imgur.com/uyQQK2A.png",
	"answer": "snow"
  }
]
```

#### Show a Post
Shows the post data for a specified post.

Path: 
`GET '/post/:post_id'`

**Parameters**
*None*

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Server successfully requested returned post data.
400 | Error | Bad Request. Specified parameters do not match.


**Example Response**
```
{
  "id": 1,
  "owner": {
	"username": "zebracakes",
	"full_name": "Lil Debbie",
	"email": "lil@debbie.com",
	"total_points": 300,
  },
	"img_url": "http://i.imgur.com/zCpxKJQ.png",
	"answer": "potato"
}
```

#### Show a User's Posts
Shows all posts created by a specified user.

Path: 
`GET '/posts/user/:username`

**Parameters**
*None*

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Server successfully requested returned post data for the specified user.
400 | Error | Bad Request. Specified parameters do not match.

**Example Response**
```
[
  {
  	"id": 1,
	"owner": {
	  "username": "zebracakes",
	  "full_name": "Lil Debbie",
	  "email": "lil@debbie.com",
	  "total_points": 300,
	},
	"img_url": "http://i.imgur.com/zCpxKJQ.png",
	"answer": "potato"
  }
  {
  	"id": 2,
	"owner": {
	  "username": "zebracakes",
	  "full_name": "Lil Debbie",
	  "email": "lil@debbie.com",
	  "total_points": 300,
	},
	"img_url": "http://i.imgur.com/uyQQK2A.png",
	"answer": "snow"
  }
]
```

#### Create a Post
Creates a post for the current user.

Path: 
`POST '/posts'`

**Parameters**

Name | Type | Description
--- | --- | ---
img_url | string | **Required.** Link to the image.
answer | string | **Required.** User's answer input.

**Status Codes**

Code | Type | Description
---|---|---
201 | Success | Server has processed the request and has successfully created the post.
422 | Error | Unprocessable Entry. Specified parameters are invalid.
 
**Example Input**
```
{
  "img_url": "http://i.imgur.com/uyQQK2A.png",
  "answer": "snow"
}

```

**Example Response**
```
{
  "id": 1,
  "owner": {
		"username": "zebracakes",
		"full_name": "Lil Debbie",
		"email": "lil@debbie.com",
		"total_points": 300,
  },
  "img_url": "http://i.imgur.com/uyQQK2A.png",
  "answer": "snow"
}
```
#### Delete a Post
Deletes the specified post.

Path: 
`DELETE '/post/:post_id'`

**Parameters**
*None*

**Status Codes**

Code | Type | Description
---|---|---
204 | Success | No Content. Server successfully processed the request and has removed the post.
400 | Error | Bad Request. Specified parameters do not match.


**Example Response**
```
No Written Reponse.
Only 204 Code is returned.
```



## **Guess Model**

#### Show All Guesses of a Particular Post
Lists all the guesses in a specified post from all users.

Path: 
	`GET 'posts/:post_id/guesses'`

**Parameters** 
*None*

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Request was received and delivered successfully.
400 | Error | Bad Request. Specified parameters do not match.

**Example Response**
```
[
  {
	"id": 1,
	"owner": {
	  "username": "testusername",
	  "full_name": "John Doe",
	  "email": "test@email.com",
	  "total_points": 150,
	},
	"post_id": 1,
	"guess": "foobar",
	"points": 0
  },
  {
	"id": 2,
	"owner": {
	  "username": "zebracakes",
	  "full_name": "Lil Debbie",
	  "email": "lil@debbie.com",
	  "total_points": 300,
	},
	"post_id": 1,
	"guess": "kitty",
	"points": 80
  }
]
```

#### Show guesses for a user in a particular post
Lists all the guesses for a particular user in a specified post.

Path:
`GET 'posts/:post_id/guesses/user/:username'`

**Parameters**
*None*

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Request was received and delivered successfully.
400 | Error | Bad Request. Specified parameters do not match.

**Example Response**
```
[
  {
  	"id": 1,
	"owner": {
	  "username": "testusername",
	  "full_name": "John Doe",
	  "email": "test@email.com",
	  "total_points": 150,
	},
	"post_id": 1,
	"guess": "foobar",
	"points": 0
  },
  {
  	"id": 2,
	"owner": {
	  "username": "testusername",
	  "full_name": "John Doe",
	  "email": "test@email.com",
	  "total_points": 150,
	},
	"post_id": 1,
	"guess": "kitty",
    "points": 80
  }
]
```

#### Create a Guess
Creates a guess on a specified post from the logged in user.

Path: 
`POST 'posts/:post_id/guesses'`

**Parameters**

Name | Type | Description
--- | --- | ---
guess | string | **Required.** User provided guess to the specified post.

**Status Codes**

Code | Type | Description
---|---|---
201 | Success | Request was received and a guess was successfully created.
422 | Error | Unprocessable Entry. Specified parameters are invalid.

**Example Input**
```
{
  "guess": "foobar"
}
```

**Example Response**
```
{
  "id": 1,
  "owner": {
	"username": "testusername",
	"full_name": "John Doe",
	"email": "test@email.com",
	"total_points": 150,
  },
  "post_id": 1,
  "guess": "kitty",
  "points": 80
}
```

#### Show a Guess
Returns a specified guess.

Path: 
`GET 'guess/:guess_id'`

**Parameters**
*None*

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Request was received and delivered successfully.
400 | Error | Bad Request. Specified parameters do not match.

**Example Response**
```
{
  "id": 1,
  "owner": {
    "username": "zebracakes",
    "full_name": "Little Debbie",
    "email": "little@debbie.com",
    "total_points": 300,
  },
  "post_id": 1,
  "guess": "kitty",
  "points": 80
}
```

#### Delete a Guess
Deletes a specified guess.

Path: 
`DELETE 'guess/:guess_id'`

**Parameters**
*None*

**Status Codes**

Code | Type | Description
---|---|---
200 | Success | Request was received and delivered successfully.
400 | Error | Bad Request. Specified parameters do not match.

**Example Response**
```
{
  "message": "The guess was successfully deleted."
}
```