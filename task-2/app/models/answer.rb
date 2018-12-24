class Answer < ApplicationRecord
	validates :value, presence: true
	validates :value, format: {with: /yes|no/} #Only yes or no and nil is considered as answers
	belongs_to :question
end