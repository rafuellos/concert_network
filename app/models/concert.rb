class Concert < ActiveRecord::Base
 
  validates :venue, :band, :city, :price, :date, :description, presence: true 


  def self.show_concerts(number)
    order(date: :asc).limit(number)
  end

  def select_month(month)
    
  end
end
