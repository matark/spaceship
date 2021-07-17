class UserSerializer < ActiveModel::Serializer
  attribute :id
  attribute :name
  attribute :email
  attribute :avatar
  attribute :created_at
  attribute :updated_at
end
