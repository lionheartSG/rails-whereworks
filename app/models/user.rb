class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :listings, dependent: :destroy
  has_many :bookings
  # validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  # validates :email, uniqueness: true, format: { with: /\A.*@.*\.com\z/ }
end
