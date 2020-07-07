class Intake < ApplicationRecord
	has_many :measurements,dependent: :destroy
end
