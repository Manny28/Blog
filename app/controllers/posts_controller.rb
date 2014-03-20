class PostsController < ApplicationController
  def new
  end

  
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  http_basic_authenticate_with name: "Person", password: "Spongebob", except: [:index, :show]
  
  def create
    @post = Post.new(post_params)

    @post.save
    redirect_to @post
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
  
end