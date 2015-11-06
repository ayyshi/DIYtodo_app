class PostsController < ApplicationController

  before_action :authorize

  def index
  end

  def show
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    user = current_user
    @post = Post.new(post_params)
    user.posts.push(@post)
    if user.categories.include?(@post.category)

    else
      user.categories.push(@post.category)
    end

    if @post.save
      redirect_to user_path(current_user)
    else
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to "index"
    else
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    redirect_to user_path(current_user)
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :description,
      :photo_url,
      :goal_date,
      :completed_date,
      :category_id
    )
  end
end
