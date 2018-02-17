class UserAnswersController < ApplicationController
  before_action :load_answer

  def update
    @user_answer.update_attributes!(answer_params)
    redirect_to quiz_path(@user_answer.question.quiz_id, user_id: @user_answer.user_id)
  end

  private

  def load_answer
    @user_answer = UserAnswer.find(params[:id])
  end

  def answer_params
    params.require(:user_answer).permit(:user_id, :question_id, :answer_text)
  end
end
