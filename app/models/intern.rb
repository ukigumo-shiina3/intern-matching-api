class Intern < ApplicationRecord
  belongs_to :school_year
  belongs_to :field_of_study

  has_many :rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :companies, through: :rooms
  has_many :entries, dependent: :destroy
  has_many :jobs, through: :entries
end
