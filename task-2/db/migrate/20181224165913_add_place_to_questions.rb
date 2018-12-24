      class AddPlaceToQuestions < ActiveRecord::Migration[5.0]
        def change
        	change_table :questions do |t|
        		t.integer :place
        	end
        end
      end
