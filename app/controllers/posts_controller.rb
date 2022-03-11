class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  # Show all posts
  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:notice] = "Congratulations! Post created successfully."
      redirect_to @post
    else
      flash.now[:alert] = "Something went wrong..."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      flash[:notice] = "Congratulations! Post updated successfully."
      redirect_to @post
    else
      flash.now[:alert] = "Something went wrong..."
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.delete
    flash[:notice] = "Congratulations! Post deleted successfully."
      redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
