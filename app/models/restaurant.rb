class Restaurant < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :name, :other_comments, :phone, :state, :zip
  has_many :reviews

  validates :name, :presence => true
  validates :address1, :presence => true
  validates :city, :presence => true
  validate :phone, :length => { :is => 5}, :allow_blank => true

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ? or city LIKE ? or zip LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      find(:all)
    end
  end
end
