class Article < ApplicationRecord

    validates :title,  presence: true
    validates :content, presence: true

    belongs_to :user
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :likes, as: :likeable, dependent: :destroy, counter_cache: true


    def liked_by?(user) 
        Like.where(user: user, likeable: self).present?
    end
end
