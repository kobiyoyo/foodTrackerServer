# frozen_string_literal: true

FactoryBot.define do
  factory :measurement do
    user { nil }
    intake { nil }
    units { 1 }
  end
end
