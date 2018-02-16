class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)

    #ideal we would have some way to direct which quiz the user should be directed to
    #for now direct them to the default quiz
    redirect_to quiz_path(Quiz.first, user_id: @user.id)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
