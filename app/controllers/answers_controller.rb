class AnswersController < ApplicationController

  def send_answer
    @answer = Answer.new
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def receive_answer
    post = Post.find(params[:id])
    answer = Answer.new(answer_params)
    if answer.save
      redirect_to complete_path, flash: {success: '送信が完了しました！'}
    else
      redirect_to send_answer_path(post), flash: {error: '入力内容に不備があります。'}
    end
  end

  def complete
  end

  private
    def answer_params
      params.require(:answer).permit(:content, :post_id)
    end

end