class CamperSerializer < ActiveModel::Serializer
  attributes :id, :name, :age

  has_many :signups
    has_many :activity, through: :signups
end
