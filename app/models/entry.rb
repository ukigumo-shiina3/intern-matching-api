class Entry < ApplicationRecord
  belongs_to :intern
  belongs_to :job

  validates :intern_id, presence: true
  validates :job_id, presence: true
  validates :current_status, presence: true
end
