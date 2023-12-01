class PostsController < ApplicationController
  before_action :user_signed_in?, only: [:create, :new]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Well done you just created a cool post!'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:posts).permit(:title, :message)
  end
end
