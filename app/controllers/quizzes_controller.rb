class QuizzesController < ApplicationController
  before_action :load_user, only: :show
  before_action :load_quiz, only: :show

  def show
    @current_question = get_next_question

    if @current_question.nil?
      redirect_to complete_quiz_path(@quiz)
    else
      @user_answer = UserAnswer.find_by(question_id: @current_question.id, user_id: @user.id, completed: false)
      @user_answer ||= UserAnswer.create!(question_id: @current_question.id, user_id: @user.id)

      @time_left = @current_question.time_limit - (Time.now.to_i - @user_answer.created_at.to_i)
    end
  end

  def complete
  end

  private

  def get_next_question
    #FIX: we could do this all in one call to the database
    question_ids = @quiz.questions.pluck(:id)
    answered_questions = @user.user_answers.where(question_id: question_ids, completed: true).pluck(:question_id)

    Question.find_by(id: (question_ids - answered_questions).first)
  end


  def load_user
    @user = User.find(params[:user_id])
  end

  def load_quiz
    @quiz = Quiz.find(params[:id])
  end
end
