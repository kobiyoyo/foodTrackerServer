require 'rails_helper'

RSpec.describe Intake, type: :model do
  it{should have_many(:measurements)}
end
