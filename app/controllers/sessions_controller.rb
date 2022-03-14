class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where("LOWER(email) = ?", params["email"].downcase)[0]
    if @user
      if BCrypt::Password.new(@user.password) == params["password"]
        session["user_id"] = @user.id
        flash[:notice] = "You logged in!"
        redirect_to "/places"
      else
        flash[:notice] = "Incorrect email or password"
        redirect_to "/sessions/new"
      end
    else
      flash[:notice] = "Incorrect email or password"
      redirect_to "/sessions/new"
    end
  end






  def destroy
    session[:user_id] = nil
    flash[:notice] = "Goodbye."
    redirect_to "/sessions/new"
  end
end
  