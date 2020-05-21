class Item < ApplicationRecord
  has_many :item_attributes, dependent: :destroy
  has_many :images
end
