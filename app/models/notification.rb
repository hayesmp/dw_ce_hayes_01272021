class Notification < ApplicationRecord
  has_one :product, foreign_key: 'sku'
end
