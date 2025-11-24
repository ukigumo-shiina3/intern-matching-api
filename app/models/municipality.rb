class Municipality < ApplicationRecord
  belongs_to :prefecture
  has_many :companies, dependent: :restrict_with_error

  validates :name, presence: true
  validates :prefecture_id, uniqueness: { scope: :name }
end
