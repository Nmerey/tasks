class QuestionnaireReport
  def initialize(questionnaire)
    @questionnaire = questionnaire
    @all_questions = Question.all.where(questionnaire_id: @questionnaire.id)
    
  	
  end

  def call
    report = {}
    counts = [0,0,0] #For storing Answer count numbers by default equals to 0
    all_answers = []

    @all_questions.each do |question|
    	all_answers += Answer.all.where(question_id: question.id) #Fetch all the Answers of this Questionnaire
    end

    all_answers.each do |answer|

    	if answer.value == "yes"
    		counts[0] += 1
    	else answer.value == "no"
    		counts[1] += 1
    	end
    	
    end

    counts[2] = @all_questions.count - (counts[0] + counts[1])
    
   

    report = {@questionnaire.name => {
    	"yes" => counts[0],
    	"no" => counts[1],
    	"not_answered" => counts[2]
    }}



    

    # your code here

    return report
  end
end
