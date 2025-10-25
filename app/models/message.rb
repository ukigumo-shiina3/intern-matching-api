class Message < ApplicationRecord
  belongs_to :intern
  belongs_to :company
  belongs_to :room

  validates :content, presence: true
end
