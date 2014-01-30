class FriendCirclesController < ApplicationController
  def new
    @user = User.find_by_id(params[:user_id])
    @friend_circle = FriendCircle.new
    :new
  end

  def create
    @friend_circle = FriendCircle.new(params[:friend_circle])
    if @friend_circle.save
      redirect_to user_url(@friend_circle.user)
    else
      flash.now[:errors] = @friend_circle.errors.full_messages
      render :new
    end
  end
  
  def edit
    @user = User.find_by_id(params[:user_id])
    @friend_circle = FriendCircle.find_by_id(params[:id])
    :edit
  end
  
  def update
    @friend_circle = FriendCircle.find_by_id(params[:id])
    if @friend_circle.update_attributes(params[:friend_circle])
      redirect_to user_friend_circle_url(@friend_circle.user, @friend_circle)
    else
      flash.now[:errors] = @friend_circle.errors.full_messages
      render :edit
    end
  end
  
  def destroy
    @friend_circle = FriendCircle.find_by_id(params[:id])
    @user = @friend_circle.user
    @friend_circle.destroy
    redirect_to user_url(@user)
  end
  
  def show
    @friend_circle = FriendCircle.find_by_id(params[:id])
    if current_user == @friend_circle.user
      :show
    else
      flash[:errors] = ["You can only view your own Circles"]
      redirect_to user_url(current_user)
    end
  end
end
