class PostsController < ApplicationController
  before_action :require_login, except: [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    # This because current_user is currently signed in user so we can use this association to include user's id in post
    @post = helpers.current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: "Congratulations! Post created successfully."
    else
      flash.now[:alert] = "Something went wrong..."
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = helpers.current_user.posts.find(params[:id])
  end

  def update
    @post = helpers.current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: "Congratulations! Post updated successfully."
    else
      flash.now[:alert] = "Something went wrong..."
      render :edit
    end
  end

  def destroy
    @post = helpers.current_user.posts.find(params[:id])
    @post.delete
    redirect_to root_path, notice: "Congratulations! Post deleted successfully."
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def require_login
    unless helpers.current_user
      redirect_to root_path, alert: "You need to sign up in order to do that"
    end
  end
end
