class UsersController < ApplicationController

  before_action :user_find, only: [:edit, :update, :show, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @articles = @user.articles
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account info has been succesfully updated"
      redirect_to @user
    else
      render 'edit'
    end

  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end 

  def destroy
    @user.destroy
    session[:user_id] = nil if @user == current_user
    flash[:notice] = "Account and all associated articles successfully deleted"
    redirect_to articles_path
  end

  

  private

  def user_find
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = "Yu can only edit your own Profile"
      redirect_to @user
    end
  end
end