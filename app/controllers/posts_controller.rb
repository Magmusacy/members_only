class PostsController < ApplicationController

  # Show all posts
  def index
    @posts = Post.all
  end

end
