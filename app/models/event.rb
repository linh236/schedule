class Event < ApplicationRecord
  belongs_to :user
  validates :name, presence: true

  enum levels: {
    "normal": 1,
    "medium": 2,
    "high": 3,
    "very high": 4
  }
end
