class AddLikesCountToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :likes_count, :integer, default: 0

    Article.reset_column_information
    Article.all.each do |a|
      Article.update_counters a.id, :likes_count => a.likes.length
    end
  end
end
