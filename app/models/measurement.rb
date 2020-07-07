class Measurement < ApplicationRecord
  belongs_to :user
  belongs_to :intake
  validates :units,presence:true
end
