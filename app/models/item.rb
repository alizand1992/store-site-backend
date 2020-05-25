class Item < ApplicationRecord
  has_many :item_attributes, dependent: :destroy

  has_one_attached :thumbnail
  has_many_attached :images

  def make_thumbnail(original_image = nil)
    original_image = original_image || images.first
    original_image.blob.open do |file|
      img = ImageProcessing::Vips
              .source(file)
              .resize_to_fill!(450, 450, crop: :attention)

      self.thumbnail.attach(
        io: File.open(img),
        filename: "thumbnail_#{original_image.filename}",
        content_type: original_image.content_type
      )
    end
  end
end
