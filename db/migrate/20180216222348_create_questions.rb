class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :question_text
      t.integer :quiz_id
      t.integer :time_limit, default: 300 #300 sec = 5 min
      t.timestamps
    end
  end
end
