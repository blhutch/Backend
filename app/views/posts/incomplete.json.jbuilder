json.array! @posts do |post|
	json.id post.id
	json.owner do 
		json.username post.user.username
		json.full_name post.user.full_name
		json.email post.user.email
		json.total_points post.user.total_points
	end
	json.img_url post.img_url
	json.answer post.answer
end