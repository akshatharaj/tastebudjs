class Restaurant < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :name, :other_comments, :phone, :state, :zip
  @@per_page = 2
  has_many :reviews

  validates :name, :presence => true
  validates :address1, :presence => true
  validates :city, :presence => true
  validate :phone, :length => { :is => 5}, :allow_blank => true

  def self.search(search, page)
    if search
      where('name ILIKE ? or city ILIKE ?', "%#{search}%", "%#{search}%").paginate(:page => page)
    else
      self.paginate(:page => page).order('id DESC')
    end
  end
end
