class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :role
end
