class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: "Congratulations! Post updated successfully."
    else
      flash.now[:alert] = "Something went wrong..."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to root_path, notice: "Congratulations! Post deleted successfully."
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
