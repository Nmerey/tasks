
class Query
  def get(today: Date.today)
    sorted_date = []
    sorted_list = []
    byebug
    Post.all.each do |post|

    	diff = today - post.posted_at


    	if diff > sorted_date[0]

    		sorted_date << diff
    	else
    		sorted_date.unshift(diff)
    		
    	end
    end

    sorted_date.each do |date|

    	sorted_list << Post.all.find_by_posted_at(date)
    	
    end

    return sorted_list

  end
end
