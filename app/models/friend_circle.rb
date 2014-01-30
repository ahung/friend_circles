class FriendCircle < ActiveRecord::Base
  validates :user_id, :name, :presence  => true
  attr_accessible :user_id, :name, :friend_ids
  belongs_to :user
  has_many :friend_circle_memberships, :dependent => :destroy,
  :inverse_of => :friend_circle
  has_many :friends, :through => :friend_circle_memberships, :source => :user
  has_many :post_shares
  has_many :posts, :through => :post_shares
end
