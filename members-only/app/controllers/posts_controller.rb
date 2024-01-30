class PostsController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = @user.posts.build()
  end

  def create
    @post = @user.posts.build(valid_post_params) #This is creating a post by means of an association with the user

    if @post.save
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def set_user
      @user = User.find(1)
    end


    def valid_post_params
      params.require(:post).permit(:title, :body)
    end
end
