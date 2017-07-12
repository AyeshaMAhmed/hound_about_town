class PetsController < ApplicationController

 
  def create
    @pet = Pet.create(
      name: params[:name],
      gender: params[:gender],
      age: params[:age],
      image_url: params[:image_url]

      )
  end

  def update 
    @pet = Pet.find_by(id:params[:id])
    @pet.update(
      name: params[:name],
      gender: params[:gender],
      age: params[:age],
      image_url: params[:image_url]
      )
  end

end
