
class Query

  def get(today: Date.today)

    all_posts = Post.all
    all_comments = Comment.all
    sorted_post_order = []
    sorted_result = [] #Result

    sorted_post_order = all_posts.sort {|a,b| b.posted_at <=> a.posted_at} #Posts from latest to newest

    sorted_post_order.each do |current_post|
        
        
        sorted_comments = all_comments.where(post_id: current_post.id).sort {|a,b| a.posted_at <=> b.posted_at} #Comments from Newest to Latest
        last_comment = sorted_comments.last

        the_author = User.all.find_by_id(current_post.user_id) #Author of the current Post

        comments = []

        sorted_comments.each do |comment|
                commentor = User.all.find_by_id(comment.user_id)
                comments << {
                    content: comment.content,
                    posted_at: Time.parse(comment.posted_at.to_s),

                    author: {
                        id: comment.user_id,
                        full_name: commentor.first_names + " " + commentor.last_names,
                        age: today.year - commentor.birthday.year,
                        number_of_comments: all_comments.where(user_id: comment.user_id).count
                    }

                }
                
        end 

        sorted_result << { id: current_post.id,
            title: current_post.title,
            content: current_post.content,
            posted_at: Time.parse(current_post.posted_at.to_s),
            last_comment_at: Time.parse(last_comment.posted_at.to_s),
            number_of_comments: sorted_comments.count,
            author: {
                id: current_post.user_id,
                first_names: the_author.first_names,
                last_names: the_author.last_names,
            },
            comments: comments



        }
    end
    return sorted_result

  end

end
