module Likeable

  extend ActiveSupport::Concern

  included do 
        has_many :likes, as: :likeable, dependent: :destroy
  end

  def liked_by?(user) 
        Like.where(user: user, likeable: self).present?
  end

  def liked_by(user)
      Like.find_or_create_by(user:user, likeable: self)
  end
end