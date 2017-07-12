class PetsController < ApplicationController


  def create
    user_id = current_user.id

    Pet.create(
      user_id: user_id,
      name: params[:name],
      gender: params[:gender],
      age: params[:age],
      image_url: params[:image_url]

      )

    redirect_to "/users/#{user_id}"
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
