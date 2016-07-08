class Task < ApplicationRecord

  validates :body, length: { minimum: 5, maximum: 1000 }
  validates :list_id, presence: true
  validates :completed, inclusion: { in: [true, false] }
end
