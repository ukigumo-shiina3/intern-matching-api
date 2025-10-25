class Room < ApplicationRecord
  belongs_to :intern
  belongs_to :company
  has_many :messages, dependent: :destroy

  validates :intern_id, presence: true
  validates :company_id, presence: true
  validates :intern_id, uniqueness: { scope: :company_id }
end
