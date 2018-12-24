class QuestionnaireReport
  def initialize(questionnaire)
    @questionnaire = questionnaire
    @all_questions = Question.all.where(questionnaire_id: @questionnaire.id)
    
  	
  end

  def call
    report = {}
    answer = [0,0,0] #For storing Answer's by default equals to 0
    # answer[0] = "yes"
    # answer[1] = "no"
    # answer[2] = "not_answered"
    all_answers = []

    @all_questions.each do |question|
    	all_answers += Answer.all.where(question_id: question.id) #Fetch all the Answers of this Questionnaire
    end

    all_answers.each do |elem|

    	if elem.value == "yes"
    		answer[0] += 1
    	else elem.value == "no"
    		answer[1] += 1
    	end
    	
    end

    answer[2] = @all_questions.count - (answer[0] + answer[1])
    # Count of not_answered = all questions - yes and no answers
   

    report = {@questionnaire.name => {
    	"yes" => answer[0],
    	"no" => answer[1],
    	"not_answered" => answer[2]
    }}



    

    # your code here

    return report
  end
end
