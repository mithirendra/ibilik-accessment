# Display main boad with questions
get '/' do
	# if session[:user_id] != nil
	# 	# @current_user = User.find_by_id(session[:user_id])
	# 	# @user = User.find(session[:user_id])
	# 	# @questions = Question.all.order(click_count: :desc)  
	# else
	# 	@questions = Question.all.order(click_count: :desc)
 #  end
  @property = Property.all.order(click_count: :desc)
  erb :"static/index"
end

# Display login page
get '/login' do
	erb :"user/user_login"
end