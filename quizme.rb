require 'json'
Shoes.app(title: "Quizme") do 


filename = ask_open_file()
fileinput = File.read(filename)
foobar = JSON.parse(fileinput)
@bar = foobar.sort_by{rand}
  stack(margin: 50) do

   @question = para strong("Question.") 
   resultline = para ""
   # ugly but simple was to make sure resultline exists
   resultline.hide()
   @options = para ""
   $answer = ""
   flow do
     @response_answer = edit_line
     button ("check answer") {
          if ( ! @response_answer.text.eql?($answer)) then
            resultline.text = "Wrong answer: correct answer is #{$answer} "
          else
            resultline.text = "Correct"
          end
     }
   end
   resultline = para "     " 
   flow do
     button ("next question") {
       foo = @bar.pop()
        @question.text =  strong("Question. "), foo['question']
        $option_list = ""
        for opt in foo['options'].each do
             $option_list << "#{opt[0]}" + " " + opt[opt.length() -1]  + "\n"
        end
        @options.text = $option_list
        resultline.text = "        "
        $answer = foo['answer']
        @response_answer.text = ""
     }
     button ("Exit Quizme") {
         exit
     }
    end
  end
key = @bar.pop()
   @question.text =  strong("Question."), key['question'] 
   $option_list = ""
   for opt in key['options'].each do
       $option_list.append("#{opt[0]} ", opt[opt.length() -1 ], "\n")
   end
   @options.text = $option_list  
   $answer = key['answer']
end

