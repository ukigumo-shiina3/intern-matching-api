class Company < ApplicationRecord
  belongs_to :prefecture
  belongs_to :municipality

  has_many :jobs, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :interns, through: :rooms

  validates :prefecture, :municipality, presence: true
end
