class Job < ApplicationRecord
  belongs_to :company
  has_many :entries, dependent: :destroy

  validates :title, :intern_conditions, presence: true
  validates :is_published, inclusion: { in: [ true, false ] }
end
