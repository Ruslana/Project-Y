class Order < ActiveRecord::Base
  has_and_belongs_to_many :uploads, :join_table => 'orders_uploads'
  
  def self.calculate_sum(order)
    order.uploads.inject(0){|sum, track| sum + track.price.to_i}
  end
  
end
