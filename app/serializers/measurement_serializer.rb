class MeasurementSerializer < ActiveModel::Serializer
  attributes :id, :units
  has_one :user
  has_one :intake
end
