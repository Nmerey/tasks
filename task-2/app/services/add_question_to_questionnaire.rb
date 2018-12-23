class AddQuestionToQuestionnaire
	attr_accessor :question
  def initialize(questionnaire:, question:, place:) #Place added
    @questionnaire = questionnaire
    @question = question
    @place = place
    @all_questions = Question.all.where(questionnaire_id: @questionnaire.id)
  end

  def call
  	
  	if @place.nil?
  		@place = @all_questions.count

  	elsif @place.to_s.count("a-zA-Z") > 0 #Checks for letters in given place instance
  		raise ActiveRecord::ActiveRecordError

	elsif @place.negative?
		raise ActiveRecord::ActiveRecordError 		
  	end
  	
  	@question.questionnaire_id = @questionnaire.id
  	@question.save #Need to save question in order to update
    @questionnaire
  end
end
