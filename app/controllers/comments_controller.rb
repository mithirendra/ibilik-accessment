# Display new comment form
get '/properties/:id/comments/new' do
	@property = Property.find(params[:id])
	@current_user = current_user
	erb :"comment/new_comment"	
end

# Create new answer
post '/properties/:id/comments' do
	@property = Property.find(params[:id])
	comment = @property.comments.new(comment_desc: params[:comment], user_id: current_user.id)
	# answer = Answer.create(answer_content: params[:answer], user_id: session[:user_id], question_id: params[:q_id])
  if comment.save
  	redirect "/properties/#{@property.id}"
  else
  	erb :"user/error"
  end

  	
end

# Display answer edit form
get '/comments/:id/edit' do
 	@comment = Comment.find(params[:id])
 	@property = @comment.property
 	erb :'comment/edit_comment'
end


# Update answer
patch '/comments/:id' do
	@comment = Comment.find(params[:id])
	@property = @comment.property
	@comment.update(comment_desc: params[:content], user_id: session[:user_id])
	redirect "/properties/#{@property.id}"
end

# Delete answer
delete '/comments/:id' do
	@comment = Comment.find(params[:id])
	@property = @comment.property
	@comment.destroy
	redirect "/properties/#{@property.id}"
end
