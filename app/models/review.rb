class Review < ActiveRecord::Base
  attr_accessible :comment, :rating, :restaurant_id, :user_id

  belongs_to :user
  belongs_to :restaurant

  validate :rating, :presence => true
  validate :restaurant_id, :presence => true
  validate :user_id, :presence => true

end
