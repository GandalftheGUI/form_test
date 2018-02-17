class AddCompletedToUserAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :user_answers, :completed, :boolean, default: :false
  end
end
