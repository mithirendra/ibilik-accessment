
# Display new property from
get '/properties/new' do
	@user = User.find(current_user)
	erb :"property/new_property"	
end

# Create new property
post '/properties' do
	@user = User.find(current_user)
	property = @user.properties.new(location: params[:location], property_title: params[:title], property_desc: params[:description], extras: params[:extras], preference: params[:preference], rental: params[:rental], user_id: session[:user_id])

	if property.save
  	redirect "/properties/#{property.id}"
  else
  	erb :"user/error"
  end
end


# View property
get '/properties/:id' do
	@property = Property.find(params[:id])
	@property.click_count += 1
	@property.save
	@comments = @property.comments
	erb :"property/show_property"
end


# Display property edit form
get '/properties/:id/edit' do
	@property = Property.find(params[:id])
	@current_user = current_user
	erb :'property/edit_property'
end


# Update property
patch '/properties/:id' do
	property = Property.find(params[:id])
	property.click_count -= 1
	@current_user = current_user
	property.update(property_title: params[:title], user_id: session[:user_id], property_desc: params[:description])
	redirect "/properties/#{property.id}"
end

# Delete property
delete '/properties/:id' do
	property = Property.find(params[:id])
	property.destroy
	# question.answers.destroy_all
	# @questions = Question.all.order(click_count: :desc)
	erb :'static/index' 
end



