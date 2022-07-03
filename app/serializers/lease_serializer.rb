class LeaseSerializer < ActiveModel::Serializer
  attributes :id, :rent
  # has_one :apartment
  # has_one :tenant
  belongs_to :apartment
  belongs_to :tenant
end
