class CreateUserAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :user_answers do |t|
      t.integer :question_id, null: false
      t.text :answer_text
      t.timestamps
    end
  end
end
