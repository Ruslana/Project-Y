require 'digest/sha1'

class User < ActiveRecord::Base
  
  attr_accessible :name, :password, :password_confirmation
  attr_accessor :password_confirmation
  
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_confirmation_of :password
 
  
  def password
    @password
  end
  
  def password=(word)
    @password = word
    return if word.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end
  
  def self.authenticate(password, name)
    user = self.find_by_name(name)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end
      
  private
      
  def self.encrypted_password(password, salt)
    string_to_hash = password  + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end
  
  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end
  
end
