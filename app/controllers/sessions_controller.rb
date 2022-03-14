class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where({ email: params["email"] })[0]
    if @user
      if BCrypt::Password.new(@user.password) == params["password"]
        cookies["user_id"] = @user.id
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
  end
end
  