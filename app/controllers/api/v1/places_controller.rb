class Api::V1::PlacesController < ApplicationController

 
   def index
    @places =  Place.all 
   end

   def show 
     @place = Place.find(params[:id])
   end


   def new 
   end

   def create
     @place = Unirest.post(
       "https://api.yelp.com/v3/businesses/search?term=restaurant&location=sanfrancisco", 
       headers: {'Authorization' => 'Bearer 5fsDEJnWqGEObi2nRiBQA68cS8EwBqLdJhF0OByep0FnngxJp4xCZ_p5SDqt492SF5z-b0ebYQFyJ7IcfPuQYAz4aAKRiy-iaYgVGfx_8STx0W7GEEOltnKL_49iWXYx'}).body

     puts "UNIREST RESPONSE ======== #{@beverage}"

     redirect_to "/beverages/#{@beverage['id']}"
   end

   # def update 
   #    @beverage = Unirest.post(
   #     "http://localhost:3000/api/v2/beverages", 
   #     headers: {'Accept' => 'application/json'}, 
   #     parameters: {name: params[:name], style: params[:style], hop: params[:hop], yeast: params[:yeast], malts: params[:malts]}
   #     ).body
   # end


   def destroy
     place = Place.find(params[:id])
     place.destroy 
     redirect_to "/places/#{@place['id']}"
   end

 end

