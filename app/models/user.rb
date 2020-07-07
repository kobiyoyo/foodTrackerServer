class User < ApplicationRecord
   ROLES = [:client,:admin].freeze
 
   enum role: ROLES

   after_initialize :set_default_role, :if => :new_record?
   has_many :measurements
   has_secure_password
   validates :username, presence: true
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
   validates :email, presence: true,uniqueness: true, format: { with: VALID_EMAIL_REGEX }





   def set_default_role
   	self.role ||= :client
   end
end
