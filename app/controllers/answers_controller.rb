class AnswersController < ApplicationController

  def show
    @answer = Answer.new
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def create
    answer = Answer.new(answer_params)
    post = Post.find(answer.post_id)
    if answer.save
      redirect_to answers_path, flash: {success: '送信が完了しました！'}
    else
      redirect_to answer_path(post), flash: {error: '入力内容に不備があります。'}
    end
  end

  def destroy
    answer = Answer.find(params[:id])
    answer.destroy
    redirect_to post_path(answer.post_id), flash: {info: '答えを削除しました。'}
  end

  def complete
  end

  private
    def answer_params
      params.require(:answer).permit(:content, :post_id)
    end

end