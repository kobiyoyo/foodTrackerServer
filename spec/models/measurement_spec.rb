require 'rails_helper'

RSpec.describe Measurement, type: :model do
  it{should belong_to(:intake)}
  it{should belong_to(:user)}
end
