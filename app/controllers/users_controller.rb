class UsersController < ApplicationController
  before_action :set_user, only: %i[edit]
  
  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    binding.pry
    if @user.save
      redirect_to root_path, notice: "You've successfully signed up!"
    else

      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "You've successfully update!"
    else

      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :date_of_birth, :description, :gender)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
