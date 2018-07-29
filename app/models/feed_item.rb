class FeedItem < ActiveRecord::Base
    self.inheritance_column  = nil

    belongs_to :ref, polymorphic: true
    belongs_to :user


end