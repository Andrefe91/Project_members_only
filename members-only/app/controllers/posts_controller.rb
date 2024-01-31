class PostsController < ApplicationController
  before_action :set_user

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

  def edit
    @post = @user.posts.find(params[:id])
  end

  def update
    @post = @user.posts.find(params[:id])

    if @post.update(valid_post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = @user.posts.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def set_user
      @user = User.find(1)
    end

    def valid_post_params
      params.require(:post).permit(:title, :body)
    end
end
