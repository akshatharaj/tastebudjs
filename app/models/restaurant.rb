class Restaurant < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :name, :other_comments, :phone, :state, :zip

  def self.search(search)
    search_condition = "%" + search + "%"
    find(:all, :conditions => ['name LIKE ? OR city LIKE ? or zip LIKE ?', search_condition, search_condition, search_condition])
  end

end
