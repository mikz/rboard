require 'digest/sha1'
class User < ActiveRecord::Base
  include Rboard::UserExtension
  include Rboard::Permissions

  alias_attribute :name, :display_name
  
  attr_accessible :name, :display_name, :password, :password_confirmation, :email,
                  :signature, :time_zone, :date_display, :per_page
                  
  
  
  def self.table_name
    'users'
  end

  # Authenticates a user by their login name and unencrypted password.  Returns the user or nil.
  def self.authenticate(login, password)
    u = find_by_login(login) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    self.password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    self.remember_token_expires_at = 2.weeks.from_now.utc
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  protected
  def encrypt_password
    self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{login}--")
    self.password = encrypt(password)
  end
  
  def encrypt_password?
    new_record? || password != self.class.find(self.id).password
  end
  def password_required?
    new_record? or not password.to_s.empty?
  end
end
