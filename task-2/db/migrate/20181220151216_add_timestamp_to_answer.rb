      class AddTimestampToAnswer < ActiveRecord::Migration[5.0]
        def change
        	change_table :answers do |t|
        		t.timestamps
        		
        	end
        end
      end
