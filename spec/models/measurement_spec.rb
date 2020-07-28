require 'rails_helper'

RSpec.describe Measurement, type: :model do
  describe 'association test' do
    it { is_expected.to belong_to(:intake) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of :units }
  end
end
