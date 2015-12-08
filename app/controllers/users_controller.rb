# --------- User login and logout  -----

# User login
post '/users/login' do
	user = User.find_by(email: params[:email])
	
	if user.nil?
		redirect "/failed"
	else
		session[:user_id] = user.id
		redirect "/"
	end
end

# User logout
post '/users/logout' do
    session[:user_id] = nil
		redirect "/thank_you"    
end


# Display thank you page
get '/thank_you' do
	erb :"static/thank_you"
end



# --------- Users ---------------

# Display new user form
get '/users/new' do
	erb :"user/new"
end

# Create new user
post '/users' do
	user = User.create(name: params[:name], email: params[:email], password: params[:password])
	session[:user_id] = user.id
	redirect "/"
end
	
# View user dashboard
get '/dashboard/:id' do
	@user=User.find(params[:id])
	@property = Property.all
	erb :"user/dashboard"
end

# View user profile
get '/users/:id' do
	@user=User.find(params[:id])
	erb :"user/show"
end


# Display user edit form
get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :"user/edit"
end

# Display user password edit form
get '/users/:id/edit/password' do
	@user = User.find(params[:id])
	erb :"user/password"
end

# Display user password edit form
get '/users/:id/edit/email' do
	@user = User.find(params[:id])
	erb :"user/email"
end

# Update user profile
patch '/users/:id' do
	user = User.find(params[:id])
	user.update(name: params[:name], description: params[:description])
	redirect "/dashboard/#{user.id}"
end

# Update user password
patch '/users/:id/password' do
	user = User.find(params[:id])
	user.update(password: params[:password])
	redirect "/dashboard/#{user.id}"
end

# Update user email
patch '/users/:id/email' do
	user = User.find(params[:id])
	user.update(email: params[:email])
	redirect "/dashboard/#{user.id}"
end

# Delete user
	delete '/users/:id' do
	user = User.find(params[:id])
	if user.properties.any?
		user.properties.each do |property|
			property.update(user_id: 1) 
		end
	end
	if user.comment.any?
		user.comments.each do |comment|
			comment.update(user_id: 1) 
		end
	end
	session[:user_id] = nil
	user.destroy
	erb :"static/thank_you"

end

# Show user properties
get '/users/properties/:id' do
	@property = Property.where(user_id: params[:id])
	@user = User.find(params[:id])
	erb :"property/show_all_properties"
end

# Show user comments
get '/users/comments/:id' do
	@comments = Comment.where(user_id: params[:id])
	@user = User.find(params[:id])
	erb :"comment/show_all_comments"
end

# Show user bookings
get '/users/bookings/:id' do
	@bookings = Booking.where(user_id: params[:id])
	@user = User.find(params[:id])
	erb :"booking/show_all_bookings"
end


# -------- Failed ---------------

get '/failed' do
	erb :"user/failed"
end

# get '/question_error' do
# 	erb :"user/question_error"
# end

# get '/answer_error' do
# 	erb :"user/answer_error"
# end