class Concert < ActiveRecord::Base
  has_many :comments
  validates :venue, :band, :city, :price, :date, :description, presence: true 


  def self.show_concerts(number)
    order(date: :asc).limit(number)
  end

  def self.show_concerts_by_price(price)
    where("price < ?", price).order(price: :asc)
    
  end


end
