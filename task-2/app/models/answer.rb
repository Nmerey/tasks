class Answer < ApplicationRecord
	validates :value, presence: true
	validates :value, format: {with: /yes|no/}
	belongs_to :question
end