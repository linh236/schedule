class Event < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :user
  has_many :approves, dependent: :destroy
  validates :name, presence: true
  after_create :create_approved

  scope :leave, ->{ where(is_leave: true).order(created_at: :desc) }
  scope :only_events, -> { where(is_leave: false) }
  enum levels: {
    "normal": 1,
    "medium": 2,
    "high": 3,
    "very high": 4
  }

  enum status: {
    "process": 1,
    "approved": 2,
    "disapproved": 3,
  }

  def create_approved
    if self.is_leave
      approve = Approve.create(event_id: self.id)
    end
  end
end
