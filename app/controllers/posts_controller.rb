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
    post = Post.new(post_params)
    user.posts.push(post)
    if !user.categories.include?(post.category)
      user.categories.push(post.category)
    end

    if post.save
      redirect_to user_path(current_user)
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
    post = User.find(params[:id])
    post.destroy

    redirect_to category_path
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :description,
      :goal_date,
      :completed_date,
      :category_id
    )
  end
end
