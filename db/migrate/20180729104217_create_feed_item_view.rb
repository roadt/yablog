class CreateFeedItemView < ActiveRecord::Migration[5.2]

  def up
    execute <<-SQL
    create view feed_items as 
    ( select type as ref_type, id as ref_id , title, user_id, likes_count, created_at  
      from (
        select  'Post'as type, id, title, user_id, likes_count, created_at from posts  
        union all
        select 'Article' as type ,id, title, user_id, likes_count, created_at from articles
      ) feed_items  order by created_at desc) ;
    SQL
  end

  def down
    execute <<-SQL
      drop view feed_items
    SQL
  end
end
