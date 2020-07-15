require 'rails_helper'

RSpec.describe Intake, type: :model do
  describe 'association test' do
    it { should have_many(:measurements) }
  end
  describe 'validation' do
    it { should validate_presence_of :title }
    it { should validate_length_of(:title).is_at_least(4) }
  end
end
