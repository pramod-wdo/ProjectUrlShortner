class User < ActiveRecord::Base
  has_many :short_urls, dependent: :destroy
  has_secure_password
  validates_presence_of :name, :email
  validates :email, uniqueness: true
end
