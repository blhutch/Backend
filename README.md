# Backend API for Dcryptr

## Example API Responses

### User Model

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