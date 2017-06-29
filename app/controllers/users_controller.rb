class UsersController < ApplicationController

  def new
    render 'new.html.erb'
  end

  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password]
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
end