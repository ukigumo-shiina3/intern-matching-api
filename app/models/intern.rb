class Intern < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :companies, through: :rooms
  has_many :entries, dependent: :destroy
  has_many :jobs, through: :entries
end
