class Approve < ApplicationRecord
  acts_as_paranoid
  belongs_to :event
  belongs_to :user, optional: true

  after_create :update_position

  scope :approve_process, -> { where(is_approved: false, user_id: nil) }
  scope :approved, -> { where("is_approved = true and user_id != ''") }
  scope :disapproved, -> { where("is_approved = false and user_id != ''") }
  scope :filter_approve, ->(month_of_year) { where(created_at: month_of_year.beginning_of_month..month_of_year.end_of_month) }

  def update_position
    self.update(position: self.id)
  end
end
