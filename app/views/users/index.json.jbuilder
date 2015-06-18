json.array! @users do |user|
	json.id user.id
	json.username user.username
	json.full_name user.full_name
	json.email user.email
	json.total_points user.total_points
end