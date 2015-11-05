class PostsController < ApplicationController

  before_action :authorize

  def index
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    binding.pry

    if post.save
      redirect_to "index"
    else
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])

    if post.update(post_params)
      redirect_to "index"
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :description,
      :goal_date,
      :completed_date,
      :user_id
    )
  end
end