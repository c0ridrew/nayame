class UsersController < ApplicationController
  before_action :authenticate

  def mypage
    @user = User.find(params[:id])
    @post = Post.new
  end

end