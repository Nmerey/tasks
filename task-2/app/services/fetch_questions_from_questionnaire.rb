class FetchQuestionsFromQuestionnaire
  def initialize(questionnaire)
    @questionnaire = questionnaire
    @all_questions = Question.all.where(questionnaire_id: @questionnaire.id).sort #All questions of this.questionnaire in sorted order
  end

  def call
    questions = []

  	@all_questions.each do |question|

  		if question.place != nil && questions[question.place].nil? #Checks if the place is taken or not in array
  			questions[question.place] = question
  		elsif question.place != nil #If place is taken then insert the question to right before place
  			questions.insert(question.place,question)
  		else
  			questions << question
  			
  		end
  		
  	end

  	questions.compact #Removes all nil in the array
  end
  
end
