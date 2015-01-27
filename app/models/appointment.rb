class Appointment < ActiveRecord::Base
  belongs_to :escort
  belongs_to :client

  validates :time, presence: true
  validates :location, presence: true
  validates :price, presence: true

  validates_associated :escort
  validates_associated :client
end
