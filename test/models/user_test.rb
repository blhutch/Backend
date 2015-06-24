require 'test_helper'

class UserTest < ActiveSupport::TestCase

	test "if new user generates token" do
		user = User.create(email: "test1@gm.com", username: "username90", password: "something")
		assert_not_nil user.access_token, "Did not create a token for a new user"
	end

	test "must have password" do
		user = User.new(email: "test2@gm.com", username: "username91")
		refute user.save, "Requires password to save"
	end

	test "must have email" do
		user = User.new(username: "username92", password: "something")
		refute user.save, "Requires email to save"
	end

	test "email is unique" do 
		user1 = User.create(email: "test@gm.com", username: "username93", password: "something")
		user2 = User.new(email: "test@gm.com", username: "username94", password: "something")
		refute user2.save, "Requires email to be unique"
	end

	test "email is in correct format" do
		user = User.new(email: "bademail", username: "username95", password: "something")
		refute user.save, "Requires email to be in the correct format"
	end

	test "must have username" do
		user = User.new(email: "test3@gm.com", password: "something")
		refute user.save, "Requires username to save"
	end

	test "username is unique" do
		user1 = User.create(email: "test4@gm.com", username: "username96", password: "something")
		user2 = User.new(email: "test5@gm.com", username: "username96", password: "something")
		refute user2.save, "Requires username to be unique"
	end

end
