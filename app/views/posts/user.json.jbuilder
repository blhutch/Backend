json.array! @post do |post|
	json.id post.id
	json.owner do 
		json.username post.username
		json.full_name post.full_name
		json.email post.email
		json.total_points post.total_points
	end
	json.img_url post.img_url
	json.answer post.answer
end