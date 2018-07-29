class Comment < ApplicationRecord
  validates :content, presence: true
  validates :user_id, presence: true
  
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  default_scope { order(created_at: :desc) }
end
