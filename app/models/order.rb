class Order < ApplicationRecord
  belongs_to :customer
  has_one :product, foreign_key: 'sku'
end
