class PostsController < ApplicationController
  before_filter :ensure_logged_in
  
  def index
    @posts = current_user.posts
    :index
  end
  
  def new
    @post = Post.new
    3.times {@post.links.build}
    :new
  end
  
  def create
    @post = Post.new(params[:post])
    @links = params[:posts][:links_attributes].values.delete_if do |link|
      link["title"] == "" && link["url"] == ""
    end
    @post.links.build(@links)
    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to new_post_url
    end
  end
  
  def show
    @post = Post.find_by_id(params[:id])
    :show
  end
  
  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy
    redirect_to posts_url
  end
  
  def feed
    @posts = []
    current_user.friend_circle_memberships.each do |membership|
      @posts.concat(membership.friend_circle.posts)
    end
    render :feed
  end
  
end
