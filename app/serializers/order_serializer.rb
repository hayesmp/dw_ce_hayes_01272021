class OrderSerializer < ActiveModel::Serializer
  attributes :id, :sku, :total, :created_at
end
