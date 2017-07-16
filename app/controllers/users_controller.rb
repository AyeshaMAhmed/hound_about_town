class UsersController < ApplicationController

  def index
    @users = User.all
    @pets = Pet.all
  end

  def new
  end

  def create
    @user = User.new(
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
      avatar: params[:avatar]
      )

    
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Successfully created account!'

      redirect_to "/users/#{@user.id}"
    else
      errors = "Please fix the following errors: "
      @user.errors.full_messages.each do |message|
        errors += "#{message} " 
      end

      flash[:warning] = errors
      redirect_to '/signup'
    end
  end


  def show
    @user = User.find(params[:id]) #single hash. You can also use .find(recipe_id)
    @pets = @user.pets
    @places = @user.places
    render "show.html.erb"
  end


  def edit
    if current_user 
      @user = User.find_by(id: params[:id]) #single hash
      render "edit.html.erb"
    else
      redirect_to '/users/show'
    end
  end

  def update
    @user = User.find_by(id:params[:id])
    @user.update(
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
      avatar: params[:avatar]
      )
    
    flash[:success] = "User Information updated!"
    redirect_to "/users/#{@user.id}"
  end
  
  def destroy
     user = User.find_by(id:params[:id])
     user.destroy
     flash[:danger] = "Account successfully deleted!"
     redirect_to "/login"
   end

end