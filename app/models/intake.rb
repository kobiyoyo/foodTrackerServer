class Intake < ApplicationRecord
  has_many :measurements
  validates :title, presence: true, length: { in: 4..50 }
end
