class Post < ActiveRecord::Base
  attr_accessible :title, :body, :user_id, :shared_circle_ids
  validates :title, :body, :user, :presence => true
  
  belongs_to :user
  has_many :links, :dependent => :destroy, :inverse_of => :post
  has_many :post_shares
  has_many :shared_circles, :through => :post_shares, :source => :friend_circle
  
  accepts_nested_attributes_for :links
end
