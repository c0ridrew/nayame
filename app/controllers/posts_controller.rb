class PostsController < ApplicationController
  before_action :authenticate

  def index
    @user = User.find(current_user.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, flash: {info: '投稿を削除しました。'}
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, flash: {success: '投稿が完了しました！'}
    else
      redirect_to :back, flash: {error: '入力内容に不備があります。'}
    end
  end

  def browse
    @posts = Post.all
  end

  def receive_answer
  end

  def authenticate
    redirect_to new_user_registration_path, flash: {error: 'ログインしていません'} unless user_signed_in?
  end

  private
    def post_params
      params.require(:post).permit(:content, :like, :user_id)
    end
end