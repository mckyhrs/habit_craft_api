class Habit < ApplicationRecord
  validates :title, presence: true
end
