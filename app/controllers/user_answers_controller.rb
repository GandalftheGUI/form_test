class UserAnswersController < ApplicationController
  def create
    @user_answer = UserAnswer.create!(answer_params)
    redirect_to quiz_path(@user_answer.question.quiz_id, user_id: @user_answer.user_id)
  end

  private

  def answer_params
    params.require(:user_answer).permit(:user_id, :question_id, :answer_text)
  end
end
