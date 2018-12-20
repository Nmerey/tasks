class FetchQuestionsFromQuestionnaire
  def initialize(questionnaire)
    @questionnaire = questionnaire
  end

  def call
    questions = []

    Question.all.each do |question|
    	if question.questionnaire_id == @questionnaire.id
    		questions << question
    	end 
    	
    end
    return questions   # collection of Question objects
  end
  
end
