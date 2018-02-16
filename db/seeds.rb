# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


default_quiz = Quiz.create!(name: "default quiz")
default_quiz.questions << Question.new(question_text: "In your career thus far, what has been your favorite job and least favorite job and why?")
default_quiz.questions << Question.new(question_text: "What do you hope to be doing professionally five years from now?")
default_quiz.questions << Question.new(question_text: "Imagine that you are hired to work at a home repair company. Please describe how you would go about generating customers for your new company.")
default_quiz.save!