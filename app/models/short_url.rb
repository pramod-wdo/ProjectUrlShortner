class ShortUrl < ActiveRecord::Base
  belongs_to :user
  has_many :short_visits

  validates_presence_of :original_url

  after_create :generate_short_url

  def generate_short_url
    self.shorty = self.id.to_s(36)
    self.save
  end
end