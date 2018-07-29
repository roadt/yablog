class HomeController < ApplicationController
  
  def index
    # SQL +  kaminari paginate_array
    # sql_text = <<-SQL
    #   select * from (
    #     select  'Post'as model_type, id, title, user_id, likes_count, created_at from posts  
    #     union all
    #     select 'Article' as model_type, id, title, user_id, likes_count, created_at from articles
    #   ) feed_items  order by created_at desc 
    # SQL
    #@feed_items = FeedItem.find_by_sql(sql_text)

    # Stick to db solution, better version.  
    @feed_items = FeedItem.includes(:ref => :comments ).page(params[:page])

  end


  def most_liked
     @feed_items = FeedItem.includes(:ref => :comments).where("likes_count > 3").page(params[:page])
  end
end
