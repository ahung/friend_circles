class PasswordsController < ApplicationController

  def new
    :new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      UserMailer.reset_password_email(@user).deliver
      flash[:errors] = ["Check your email for instructions"]
      redirect_to new_session_url
    else
      flash.now[:errors] = ["Email Not Found"]
      render :new
    end
  end

  def edit
    @pw_reset_token = params[:pw_reset_token]
    :edit
  end

  def update
    @user = User.find_by_pw_reset_token(params[:pw_reset_token])
    if @user

      if @user.update_attributes(:password => params[:password])
        flash[:errors] = ["Password changed!"]
        redirect_to new_session_url
      else
        flash.now[:errors] = @user.errors.full_messages
        @pw_reset_token = params[:pw_reset_token]
        render :edit
      end
    else
      flash[:errors] = ["Link Expired"]
      redirect_to new_session_url
    end
  end

end
