class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "更新しました"
      redirect_to @user
    else
      flash[:danger] = "更新失敗"
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, 
                                 :password_confirmation, :profile, :area)
  end
  
  def set_user
    @user = User.find(params[:id])
    redirect_to(root_url) if @user != current_user
  end
end
