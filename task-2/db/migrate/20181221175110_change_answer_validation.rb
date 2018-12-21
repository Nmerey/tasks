      class ChangeAnswerValidation < ActiveRecord::Migration[5.0]
        def change
        	change_column :answers, :value, :string, :null => true
        	#Changed null => false to true so it can have "not_aswered" key
        end
      end
