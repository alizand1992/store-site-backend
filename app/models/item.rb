class Item < ApplicationRecord
  has_many :item_attributes, dependent: :destroy

  has_one_attached :thumbnail
  has_many_attached :images

  def make_thumbnail
    original_image = images.first
    original_image.blob.open do |file|
      img = ImageProcessing::Vips
              .source(file)
              .resize_to_fill!(350, 350, crop: :attention)

      self.thumbnail.attach(
        io: File.open(img),
        filename: "thumbnail_#{original_image.filename}",
        content_type: original_image.content_type
      )
    end

    self.save!
  end
end
