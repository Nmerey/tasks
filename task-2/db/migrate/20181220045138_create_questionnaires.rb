      class CreateQuestionnaires < ActiveRecord::Migration[5.0]
        def change
        	create_table :questionnaires do |t|
        		t.string :name, null: false
        		
        		
        	end
        end
      end
