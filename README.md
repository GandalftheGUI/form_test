Functionality
------------------------------------------------------

  All requested functionality has been implemented. A user can enter their name and email and can start the quiz. Even if a user refreshes the page during a quiz they will not lose their place nor will the timer reset. The user can click next to submit and access the next question, additionally when the timer runs out the questions is also submitted. Once the quiz is done the user is shown the completed quiz page. Attempting to access the earlier questions will direct the user to the completed quiz page.


Implementation notes
------------------------------------------------------

#### Quizzes as a table
I implemented the quiz as its own table. I did this so that administrators of the platform could potentially add new quizzes depending on the position being screened for.

#### All questions load from the same URL
I did not want the users trying to exploit the URL to change which question they are currently on. The current question is always loaded based on which questions the user has submitted so far. I also wanted a way for users continue from the same point, in case the user lost connection or accidentally navigated away from the page.

#### About the timer:
Currently only implemented in the front end. The server does keep track of time remaining (when the question was started and allowed duration for the question, 'questions.time_limit') and while I would lock out input to the question on the server after the time has run out I have not yet implemented a way to ensure the question to be saved right before that happens.

#### About user authentication:
There is none, if a user attempts to access the quiz again by inputing the same name/email it will create a new user and a new set of answers. Any user could also access another users quiz by changing request the parameters. User authentication would fix these issues. Additionally, going forward I would have some sort of token in the link as well as validate against the email the user entered to ensure the user cannot take the same quiz again.


To-do's going forward
------------------------------------------------------

  - [ ] Have an ability in the back end to specify which quiz the user gets sent to, the system currently only uses one 'default quiz'
  - [ ] Add validations to models and front end, e.g. email verification, check if user has input an answer before showing next question etc.
  - [ ] Once user authentication is added we can check the current user instead of passing the user_id around in the parameters of each request.
  - [ ] Implement front end designs.


