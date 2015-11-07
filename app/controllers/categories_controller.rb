class CategoriesController < ApplicationController

  before_action :authorize

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    user = current_user
    @category = Category.new(category_params)
    user.categories.push(@category)

    if @category.save
      redirect_to user_path(user)
    else
      render "new"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to user_path(user)
    else
      render "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.users.delete(current_user)

    redirect_to user_path(current_user)
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
