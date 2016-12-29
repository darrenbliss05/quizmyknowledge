# quizme
The quizme tool was born out of the desire to expand my knowledge of Ruby, to 
learn about shoes, and provide a quizing program to reinforce learning. I could
not find any good free tools that allows someone not in the education system to
effectively create personal quizes to test your knowledge on a topic that you
are trying to learn. 

The design is that each quiz is self contained with a json formated file and 
to present the questions in a random order. This is the goal for the first 
revision of the application. I expect that a future revision will include 
being able to include a group of quizes to create a larger quiz. 


The layout of the GUI will start out simple in the initial revision. 

# This is applicatin layout.

1.  Question: This is just text the displays the question.

1.  Optional image(future enhancement): Right after the question is a good place to display 
                images related to the question. Not sure if this will make the 
                initial version. Adding to spec as a wish list item. 

1.  Answer options: For multiple choice this is the text that 
                provides the options that can be selected. For non-multiple
                choice questions this is just blank. 

1.  section: Text box to input your answer. This will be compared to the 
               documented answer. The "check answer" button will compare 
               your answer to the answer provided in the file and then provide i
               feedback right under the answer box ie "results". 

1.  section: Results. This will provide feedback showing if the answer is 
               correct or wrong. This will also show the correct answer.

1.  buttons "next question" and "exit: Pretty obvious


The basic is usage is that you will be fiirst asked what file to opne and then it will present you with the first question. Use the "next question" button to 
move to the enxt question, very simple interface.

## Downloading
The download direction contains the shoed up version of quizme for windows. This
will automatically install shoes on your windows system to enable runing of 
quizme. 

The <repo>/quizes direction contains the sample file binary_conversion.quiz. 


## Json file format
In rev 0.5 the file format is a simple json file with three main keys that 
are repeated in blocks. For exact details look at quizes/binary_conversion.quiz. 

question: This contains the string text of the question to ask.

options: This list of answer options to add below the question. 

answer: This is the answer to the quesiton.

# history
revsion 0.5: Initial revison of the application. Basic features are in place 
             but there really in not any error checking in place. 
             feature list:
                1. Presents quesitons in a random order
                1. provides feedback with the correct answer
                1. Support mulit-choice questions using the answer options
             known issues:
                1. If the json file format is broken then the application hangs.
                1. This version does not count the run of questions or tell 
                   you when you have reach the end. 
                 
