class UsersController < ApplicationController

  before_action :authorize, except: [:new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user[:avatar_url].blank?
      
      suckr = ImageSuckr::GoogleSuckr.new
      image = suckr.get_image_url({"q" => "icon"})

      @user[:avatar_url] = "#{image}"

    end

    if @user.save
      redirect_to "/"
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete

    redirect_to '/'

  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :password,
      :password_confirmation,
      :avatar_url
    )
  end
end
