class AddAnswerToQuestion
	attr_accessor :question
	attr_accessor :answer
  def initialize(questionnaire:, question:, answer:)
    @questionnaire = questionnaire
    @question = question
    @answer = answer
  end

  def call
    # your code here
  end
end
