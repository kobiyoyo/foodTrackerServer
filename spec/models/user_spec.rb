require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association test' do
    it { is_expected.to have_many(:measurements) }
  end

  describe 'validation' do
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_uniqueness_of(:email) }
  end
end
