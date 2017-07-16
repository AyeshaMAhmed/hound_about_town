class PlacesController < ApplicationController

  def index
   
    @location = "sanfrancisco"
    state = "ca"

   if params[:city] && params[:state]
     @location = params[:city]
     state = params[:state]
   end


   @businesses = Unirest.get("https://api.yelp.com/v3/businesses/search?term=winery+dogs&location=#{@location}", headers: {'Authorization' => 'Bearer 5fsDEJnWqGEObi2nRiBQA68cS8EwBqLdJhF0OByep0FnngxJp4xCZ_p5SDqt492SF5z-b0ebYQFyJ7IcfPuQYAz4aAKRiy-iaYgVGfx_8STx0W7GEEOltnKL_49iWXYx'}).body["businesses"]

   puts "UNIREST RESPONSE ======== #{@businesses}"

 end

 def show
  @place = Place.find_by(id: params[:id])

  @winery = @place["wineryapi_id"]

  @users = @place.users


  @business = Unirest.get("https://api.yelp.com/v3/businesses/#{@winery}", headers: {'Authorization' => 'Bearer 5fsDEJnWqGEObi2nRiBQA68cS8EwBqLdJhF0OByep0FnngxJp4xCZ_p5SDqt492SF5z-b0ebYQFyJ7IcfPuQYAz4aAKRiy-iaYgVGfx_8STx0W7GEEOltnKL_49iWXYx'}).body

  
    puts "UNIREST RESPONSE ======== #{@business}"

    render :show
  end


  def create

      #check to see if this winery exists in the DB
      #if in DB, make userplace association with current user id and place id from DB
      #if not in the db, create a new place in the db
      #after associations are created, redirected to user show page. 

      place = Place.find_by(wineryapi_id: params[:wineryapi_id])

      if !place
      #create a new place in the db
      place = Place.create(
        name: params[:name],
        wineryapi_id: params[:wineryapi_id]
        )
      end

      Userplace.create(
      user_id: current_user.id,
      place_id: place.id
      )
    
    # redirect_to "/places"
    
    redirect_to "/users/#{current_user.id}"


  end


end
