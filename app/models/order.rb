class Order < ActiveRecord::Base
  has_and_belongs_to_many :uploads, :join_table => 'orders_uploads'
  

end
