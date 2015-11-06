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
    category = Category.new(category_params)
    user.categories.push(category)

    if category.save
      redirect_to "/categories"
    else
      render "new"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])

    if category.update(category_params)
      redirect_to "index"
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit(
      :status
    )
  end

end
