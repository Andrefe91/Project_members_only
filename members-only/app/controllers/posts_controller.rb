class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new()
  end

  def create
    current_user = User.find(1)
    @post = current_user.posts.build(valid_post_params) #This is creating a post by means of an association with the user

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def valid_post_params
      params.require(:post).permit(:title, :body)
    end
end
