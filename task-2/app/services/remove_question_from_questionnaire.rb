class RemoveQuestionFromQuestionnaire
	attr_accessor :question
  def initialize(questionnaire:, question:)
    @questionnaire = questionnaire
    @question = question
    @all_questions = Question.all.where(questionnaire_id: @questionnaire.id)
  end

  def call
	@question.questionnaire_id = nil
	@question.save

    @questionnaire
  end
end
