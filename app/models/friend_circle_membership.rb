class FriendCircleMembership < ActiveRecord::Base
  validates :friend_circle, :user, :presence => true
  attr_accessible :friend_circle_id, :user_id

  belongs_to :friend_circle
  belongs_to :user
end
