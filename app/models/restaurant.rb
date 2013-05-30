class Restaurant < ActiveRecord::Base
  attr_accessible :address1, :address2, :city, :name, :other_comments, :phone, :state, :zip
  has_many :reviews

  validates :name, :presence => true
  validates :address1, :presence => true
  validates :city, :presence => true
  validate :phone, :length => { :is => 5}, :allow_blank => true

  def self.search(search)
    if search
      where('name ILIKE ? or city ILIKE ?', "%#{search}%", "%#{search}%").paginate(:page => params[:page], :per_page => 2)
    else
      find(:all).paginate(:page => params[:page], :per_page => 2).order('id DESC')
    end
  end
end
