class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chat_memberships, inverse_of: :user, dependent: :destroy
  has_many :messages
  has_many :bookings
  has_many :seats, through: :bookings
end
