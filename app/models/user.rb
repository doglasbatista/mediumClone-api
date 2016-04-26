class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :validatable

  has_many :stories

  validates :username, presence: true

  after_create :generate_access_token

  private

  def generate_access_token
    begin
      self.access_token = "#{self.id}:#{Devise.friendly_token}"
    end while self.class.exists?(access_token: access_token)
    self.save
  end
end
