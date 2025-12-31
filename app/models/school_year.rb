class SchoolYear < ApplicationRecord
  has_many :interns, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
end
