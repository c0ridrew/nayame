class AnswersController < ApplicationController

  def show
    @answer = Answer.new
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def create
    answer = Answer.new(answer_params)
    if answer.save
      redirect_to posts_path
      flash[:success] = '送信が完了しました！'
    else
      redirect_back(fallback_location: root_path)
      flash[:error] = '入力内容に不備があります。'
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    answer.destroy
    redirect_to post_path(answer.post_id), flash: {info: '答えを削除しました。'}
  end

  def share
    image = ImageHelper.build(params[:post][:content]).tempfile.open
    client = Aws::S3::Client.new(
      region:            'ap-northeast-1',
      access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_KEY']
    )
    s3 = Aws::S3::Resource.new(client: client)
    path = "answer_images/test_answer_id:#{@post.id}"
    obj = s3.bucket('nayame').object(path)
    obj.upload_file(image)
  end

  private
    def answer_params
      params.require(:answer).permit(:content, :post_id)
    end

end