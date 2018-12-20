class FetchQuestionsFromQuestionnaire
  def initialize(questionnaire)
    @questionnaire = questionnaire
  end

  def call
    questions = []
    questions = Question.all.where(questionnaire_id: @questionnaire.id)
    questions   # collection of Question objects
  end
end
