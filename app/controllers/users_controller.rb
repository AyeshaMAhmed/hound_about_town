class UsersController < ApplicationController

  def new
    render 'new.html.erb'
  end

  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      age: params[:age],
      gender: params[:gender],
      city: params[:city], 
      state: params[:state],
      zipcode: params[:zipcode],
      about_me: params[:about_me],
      image_url: params[:image_url]
      )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/login'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/index'
    end
  end


  def show
    @user = User.find_by(id: params[:id]) #single hash. You can also use .find(recipe_id)
    render "show.html.erb"
  end


  def edit
    if current_user 
      @user = User.find_by(id: params[:id]) #single hash
      render "edit.html.erb"
    else
      redirect_to '/login'
    end
  end

end