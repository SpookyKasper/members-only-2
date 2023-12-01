class PostsController < ApplicationController
  before_action :user_signed_in?, only: [:create, :new]

  def new
    @post = current_user.posts.build
  end

  def create
    if current_user
      @post = current_user.posts.build(post_params)
      @post.user_id = current_user.id
      if @post.save
        redirect_to posts_path, notice: 'Well done you just created a cool post!'
      else
        render :new
      end
    end
  end

  def index
    @posts = Post.all
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:title, :message)
  end
end
