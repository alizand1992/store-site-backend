class Item < ApplicationRecord
  has_many :item_attributes, dependent: :destroy

  has_one_attached :thumbnail
  has_many_attached :images
end
