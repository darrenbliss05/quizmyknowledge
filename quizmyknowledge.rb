require 'json'
Shoes.app(title: "Quizmyknowledge") do 

def populatequestion()
        foo = @bar.pop()
        @question.text =  strong("Question. "), foo['question']
        $option_list = ""
        keylist = []
        #print foo['options'].methods()
        # Shuffle the answer keys so they are not the sam eeach time
        tmpfoo = foo['options'].clone()
        $answer = foo['answer']
        for key in tmpfoo.keys do
            keylist.push(key)
        end
        shuffledkeys = keylist.shuffle! 
        shuffledoptions = {} 
        tmpanswer = $answer
        for opt in foo['options'].each do
           keychange = shuffledkeys.pop()
           shuffledoptions[keychange] = opt[opt.length() -1]
           if opt[0] ==  tmpanswer then
                #print "Changing answer from #{tmpanswer} to #{keychange}\n"
                $answer = keychange
                #print "new answer is ", $answer, "\n";
            end
           
        end
        for opt in shuffledoptions.keys.sort do
               $option_list << "#{opt}" + " " + shuffledoptions[opt]  + "\n"
        end
        @options.text = $option_list
        @response_answer.text = ""
end

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
     button ("Exit Quizme") {
         exit
     }
     button ("next question") {
       resultline.text = ""
       populatequestion()
     }
    end
  end
  populatequestion()
#key = @bar.pop()
#   @question.text =  strong("Question."), key['question'] 
#   $option_list = ""
#   #for opt in key['options'].each do
#   for opt in key['options'] do
#       $option_list.append("#{opt[0]} ", opt[opt.length() -1 ], "\n")
#   end
#   @options.text = $option_list  
#   $answer = key['answer']
end

