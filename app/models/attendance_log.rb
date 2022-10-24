class AttendanceLog < ApplicationRecord
  belongs_to :user
  validates :user_id, uniqueness: { scope: :date, message: "You checked in today" }
end
