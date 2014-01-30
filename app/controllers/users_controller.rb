class UsersController < ApplicationController

  def new
    :new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      log_in_user(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    redirect_to new_user_url
  end

  def reset_password
    @user = User.find_by_id(params[:id])
    @user.reset_password
  end
  
  def show
    @user = User.find_by_id(params[:id])
    redirect_to user_url(current_user) unless @user == current_user
    :show
  end

end
