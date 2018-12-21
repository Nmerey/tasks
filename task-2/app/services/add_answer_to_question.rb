class AddAnswerToQuestion
	attr_accessor :question #attr accessor for changing instances
	attr_accessor :answer
  def initialize(questionnaire:, question:, answer:)
    @questionnaire = questionnaire
    @question = question
    @answer = answer
  end

  def call
    if @question.questionnaire_id == nil #Checks if Question is connected
    	raise_error(StandardError)

    else
    	@answer.question_id = @question.id
    	@answer.save #Update the answer
    end
  end
end
