class PostsController < ApplicationController
  before_action :authenticate

  def index
    @user = User.find(current_user.id)
  end

  def show
    @post = Post.find(params[:id])
    redirect_to posts_path, flash: {error: '権限がありません'} unless current_user.id == @post.user_id
  end

  def new
    @post = Post.new
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, flash: {info: '投稿を削除しました。'}
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, flash: {success: '投稿が完了しました！'}
    else
      render "new", flash: {error: '入力内容に不備があります。'}
    end
  end

  def authenticate
    redirect_to new_user_registration_path, flash: {error: 'ログインしていません'} unless user_signed_in?
  end

  private
    def post_params
      params.require(:post).permit(:content, :user_id)
    end
end