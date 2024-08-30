class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :seat
  validates :from_date, presence: true
  validates :to_date, presence: true
end
