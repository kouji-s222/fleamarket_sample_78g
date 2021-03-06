class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, :family_name, :first_name, :family_name_kana, :first_name_kana, :year, :month, :day, presence: true
  validates :name, :email, uniqueness: true
  validates :password,    length: { minimum: 7 } 
  has_one :address
  has_one :card, dependent: :destroy
  has_many :products

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :region
end
