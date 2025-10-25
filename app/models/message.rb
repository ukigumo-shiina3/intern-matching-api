class Message < ApplicationRecord
  belongs_to :room
  belongs_to :intern, optional: true
  belongs_to :company, optional: true

  validates :content, presence: true
  validate :sender_must_be_exactly_one


  def mark_as_read!
    update(read_at: Time.current) if read_at.nil?
  end

  def sender
    intern || company
  end

  private

  def sender_must_be_exactly_one
    if intern_id.blank? && company_id.blank?
     errors.add(:base, "送信者が必要です")
    elsif intern_id.present? && company_id.present?
      errors.add(:base, "送信者は1人だけです")
    end
  end
end
