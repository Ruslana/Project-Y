require 'digest/sha1'

class Order < ActiveRecord::Base
  
  before_create :calculate_sum
  before_create :generate_secret_hash
    
  has_and_belongs_to_many :uploads, :join_table => 'orders_uploads'
  
  def calculate_sum
    self.amount = uploads.inject(0) do |sum, track|
      sum + track.price.to_i
    end
  end
  
private

  def generate_secret_hash
    self.secret_hash = Digest::SHA1.hexdigest(Time.now.usec.to_s)[0..15]
  end
  
end
