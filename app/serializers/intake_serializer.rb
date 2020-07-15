# frozen_string_literal: true

class IntakeSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :measurements
end
