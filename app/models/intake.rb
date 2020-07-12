class Intake < ApplicationRecord
	has_many :measurements,dependent: :delete_all
	validates :title,presence:true, length: { in: 4..50 }
end
