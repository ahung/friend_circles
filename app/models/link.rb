class Link < ActiveRecord::Base
  attr_accessible :title, :url, :post_id
  validates :title, :url, :post, :presence => true
  
  belongs_to :post
end
