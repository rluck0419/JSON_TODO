class List < ApplicationRecord

  validates :title, length: { minimum: 2, maximum: 80 }
end
