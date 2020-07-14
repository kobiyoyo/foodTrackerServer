require 'rails_helper'

RSpec.describe Measurement, type: :model do
  describe 'association test' do 
	  it{should belong_to(:intake)}
	  it{should belong_to(:user)}
  end
  describe  'validation' do 
    	it{should validate_presence_of (:units)}
   end
end
