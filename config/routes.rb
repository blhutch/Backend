Rails.application.routes.draw do

	# Post
	get 'posts', to: 'posts#index'																					# Index of all Posts
	get 'posts/user/:user_id/incomplete', to: 'posts#incomplete'						# Index of all Posts that the user has not completed
	get 'post/:post_id', to: 'posts#show' 																	# Shows a specific post
	get 'posts/user/:user_id', to: 'posts#user' 														# Shows all posts created by a specific user
	post 'posts', to: 'posts#create'																				# Creates a post
	delete 'post/:post_id', to: 'posts#destroy'															# Deletes a specific post  

	# Guess
  get 'posts/:post_id/guesses', to: 'guesses#index'                # Index of all guesses of a particular post
  get 'posts/:post_id/guesses/user/:username', to: 'guesses#user'  # Shows the guesses for a user in a particular post
  post 'posts/:post_id/guesses', to: 'guesses#create'              # Creates a guess for a specifc post
  get 'guess/:guess_id', to: 'guesses#show'                        # Shows a particular guess
  delete 'guess/:guess_id', to: 'guesses#destroy'                  # Deletes a specific guess

end
	