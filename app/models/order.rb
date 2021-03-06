require 'digest/sha1'

class Order < ActiveRecord::Base
  
  before_create :calculate_sum
  before_create :generate_secret_hash
    
  has_and_belongs_to_many :tracks, :join_table => 'orders_tracks'
  
  def to_param
    secret_hash
  end
  
  def calculate_sum
    self.amount = tracks.inject(0) do |sum, track|
      sum + track.price.to_i
    end
  end
  
  def complete!
    update_attribute :complete, true
  end
  
  def payment_error!
    update_attribute :gateway_error, true
  end
  
private

  def generate_secret_hash
    self.secret_hash = Digest::SHA1.hexdigest(Time.now.usec.to_s)[0..15]
  end
  
end
