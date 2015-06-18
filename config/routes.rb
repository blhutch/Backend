Rails.application.routes.draw do

	# Guess
  get 'posts/:post_id/guesses', to: 'guesses#index'                # Index of all guesses of a particular post
  get 'posts/:post_id/guesses/user/:username', to: 'guesses#user'  # Shows the guesses for a user in a particular post
  post 'posts/:post_id/guesses', to: 'guesses#create'              # Creates a guess for a specifc post
  get 'guess/:guess_id', to: 'guesses#show'                        # Shows a particular guess
  delete 'guess/:guess_id', to: 'guesses#destroy'                  # Deletes a specific guess

end
