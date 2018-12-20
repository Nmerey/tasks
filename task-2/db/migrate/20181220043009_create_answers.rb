      class CreateAnswers < ActiveRecord::Migration[5.0]
        def change
        	create_table :answers do |t|
        		t.string :value, null: false
        		t.integer :question_id
        		
        	end
        end
      end
