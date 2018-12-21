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
    return questions.sort_by{|question| question.id}   # collection of Question objects in order
  end
  
end
