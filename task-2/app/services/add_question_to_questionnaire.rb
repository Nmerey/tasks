class AddQuestionToQuestionnaire
	attr_accessor :question, :place
  def initialize(questionnaire:, question:, place: nil) #Place keyword added, Default is nil when not given
    @questionnaire = questionnaire
    @question = question
    @place = place
    @all_questions = Question.all.where(questionnaire_id: @questionnaire.id)
  end

  def call
  
    @question.place = @place
    

    if @place != nil && @place.to_s.count("a-zA-Z") > 0 #Checks for letters in given place instance
  		raise ActiveRecord::ActiveRecordError
    
    elsif @place != nil && @place.negative?
		  raise ActiveRecord::ActiveRecordError 		
  	
    end
  	
  	@question.questionnaire_id = @questionnaire.id
  	@question.save #Need to save question in order to update
    @questionnaire
  end
end
