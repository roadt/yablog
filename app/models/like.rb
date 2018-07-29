class Like < ApplicationRecord
  validates :user_id, presence: true
  validates :likeable_type, presence: true
  validates :likeable_id, presence: true
  
  belongs_to :likeable, polymorphic: true, counter_cache:true
  belongs_to :user
end
