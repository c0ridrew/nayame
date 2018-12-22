class UsersController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def sign_in
    @user = User.new
  end

  def sign_up
    @user = User.new
  end

  def registration
    @user = User.new(user_params)
    if @user.save
      redirect_to nayame_index_path, :flash => { :success => "登録に成功しました" }
    else
      redirect_to sign_up_path
    end
  end

  def auth
    user = User.find_by(email: params[:email])
    if user.present?
      redirect_to nayame_index_path
    else
      redirect_to sign_in_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
