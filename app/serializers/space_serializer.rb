class SpaceSerializer < ActiveModel::Serializer
  attribute :id
  attribute :name
  attribute :description
  attribute :created_at
  attribute :updated_at

  belongs_to :user, key: 'owner'
end
