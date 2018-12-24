class RemoveQuestionFromQuestionnaire
	attr_accessor :question
  def initialize(questionnaire:, question:)
    @questionnaire = questionnaire
    @question = question
    @all_questions = Question.all.where(questionnaire_id: @questionnaire.id)
  end

  def call
  	
  	if @question.questionnaire_id != @questionnaire.id #Checks if question is in questionnaire
  		raise ActiveRecord::RecordNotFound
  	else
  		@question.questionnaire_id = nil
  		@question.save
  	end
	
    @questionnaire
  end
end
