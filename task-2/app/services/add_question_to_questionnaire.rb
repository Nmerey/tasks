class AddQuestionToQuestionnaire
	attr_accessor :question
  def initialize(questionnaire:, question:)
    @questionnaire = questionnaire
    @question = question
  end

  def call
  	@question.questionnaire_id = @questionnaire.id
  	@question.save #Need to save question in order to update
    @questionnaire
  end
end
