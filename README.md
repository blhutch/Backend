# API Documentation for Dcryptr

### **User Model**

### **Post Model**

### **Guess Model**

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
200 | Success | Request was received and delivered successfully.
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
	"message": "The guess was created and stored successfully."
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