# Display new booking form
get '/properties/:id/bookings/new' do
	@property = Property.find(params[:id])
	@current_user = current_user
	erb :"booking/new_booking"	
end

# Create new booking
post '/properties/:id/bookings' do
	@property = Property.find(params[:id])
	booking = @property.booking.new(booking: params[:booking], user_id: current_user.id)
  if booking.save
  	redirect "/properties/#{@property.id}"
  else
  	erb :"user/error"
  end
  	
end

# View booking
get '/bookings/:id' do
	@booking = Booking.find(params[:id])
	@property = @booking.property
	erb :"booking/show_booking"
end

# Display booking edit form
get '/bookings/:id/edit' do
 	@booking = Booking.find(params[:id])
 	@property = @booking.property
 	erb :'booking/edit_booking'
end


# Update answer
patch '/bookings/:id' do
	@booking = Booking.find(params[:id])
	@property = @booking.property
	@booking.update(booking: params[:booking], user_id: session[:user_id])
	redirect "/properties/#{@property.id}"
end

# Delete answer
delete '/comments/:id' do
	@booking = Comment.find(params[:id])
	@property = @booking.property
	@booking.destroy
	redirect "/properties/#{@property.id}"
end
