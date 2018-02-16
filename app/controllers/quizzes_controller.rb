class QuizzesController < ApplicationController
  before_action :load_user, only: :show
  before_action :load_quiz, only: :show

  def show
    @current_question = get_next_question

    redirect_to complete_quiz_path(@quiz) if @current_question.nil?
  end

  def complete
  end

  private

  def get_next_question
    #FIX: we could do this all in one call to the database
    question_ids = @quiz.questions.pluck(:id)
    answered_questions = @user.user_answers.where(question_id: question_ids).pluck(:question_id)

    Question.find_by(id: (question_ids - answered_questions).first)
  end


  def load_user
    @user = User.find(params[:user_id])
  end

  def load_quiz
    @quiz = Quiz.find(params[:id])
  end
end
