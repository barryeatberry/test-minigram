class User < ActiveRecord::Base
  validates_presence_of :name, :email
  validates_uniqueness_of :email , case_sensitive: false
  validates_format_of :email, with: /@.*\./

  before_save {self.email = email.downcase}

has_secure_password

has_many :grams

end
