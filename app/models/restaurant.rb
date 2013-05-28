class Restaurant < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :name, :other_comments, :phone, :state, :zip
end
