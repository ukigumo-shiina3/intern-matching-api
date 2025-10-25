class Company < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :interns, through: :rooms
end
