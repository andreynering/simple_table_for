class PostsController < ApplicationController
  def index
    @posts = Post.all
    render params[:template]
  end
end
