class PostsController < ApplicationController
  before_action :authenticate

  def index
    @user = User.find(current_user.id)
    @post = Post.new
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @answer = Answer.new
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
      respond_to do |format|
        format.html { redirect_to :root }
        format.json { render json: @todo }
      end
    else
      render "new", flash: {error: '入力内容に不備があります。'}
    end
    # if @post.save
    #   image = ImageHelper.build(params[:post][:content]).tempfile.open
    #   client = Aws::S3::Client.new(
    #     region:            'ap-northeast-1',
    #     access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
    #     secret_access_key: ENV['AWS_SECRET_KEY']
    #   )
    #   s3 = Aws::S3::Resource.new(client: client)
    #   path = "post_images/test_post_id:#{@post.id}"
    #   obj = s3.bucket('nayame').object(path)
    #   obj.upload_file(image)
    #   redirect_to posts_path, flash: {success: '投稿が完了しました！'}
    # else
    #   render "new", flash: {error: '入力内容に不備があります。'}
    # end
  end

  private
    def post_params
      params.require(:post).permit(:content, :user_id)
    end
end
