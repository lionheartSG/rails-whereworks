class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :listings, dependent: :destroy
  has_many :bookings
<<<<<<< HEAD
  has_many :user_reviews, dependent: :destroy, through: :bookings
=======
>>>>>>> b60683e797f946bb8d27e48d2273f61845d442b3

  has_one_attached :photo
  # validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  # validates :email, uniqueness: true, format: { with: /\A.*@.*\.com\z/ }
end
