class PetsController < ApplicationController


  def create
    user_id = current_user.id

    Pet.create(
      user_id: user_id,
      name: params[:name],
      gender: params[:gender],
      age: params[:age],
      avatar: params[:avatar]
      )

    redirect_to "/users/#{user_id}"
  end

  def edit
    @pet = Pet.find_by(id: params[:id]) #single hash
    render "edit.html.erb"

  end


  def update 
    @pet = Pet.find_by(id:params[:id])
    @pet.update(
      name: params[:name],
      gender: params[:gender],
      age: params[:age],
      avatar: params[:avatar]
      )

    redirect_to "/users/#{current_user.id}"
  end

  def destroy
     @pet = Pet.find_by(id:params[:id])
     @pet.destroy
     flash[:danger] = "Pet deleted"
     redirect_to "/users/#{current_user.id}"
   end



end
