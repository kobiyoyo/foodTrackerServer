require 'rails_helper'

RSpec.describe Intake, type: :model do
  describe 'association test' do
    it { is_expected.to have_many(:measurements) }
  end

  describe 'validation' do
    it { should have_many(:measurements).dependent(:destroy) }
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_length_of(:title).is_at_least(4) }
  end
end
