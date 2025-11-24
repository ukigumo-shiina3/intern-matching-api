class Prefecture < ApplicationRecord
  has_many :municipalities, dependent: :destroy
  has_many :companies, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
end
