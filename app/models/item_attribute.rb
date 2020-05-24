class ItemAttribute < ApplicationRecord
  belongs_to :item

  def self.create_or_save_from_json(fields, item_id)
    fields = JSON.parse(fields)
    fields.each do |field|
      item_attr = {
        item_id: item_id,
        name: field['name'],
        value: field['value'],
      }

      if field['id'].present?
        attr = ItemAttribute.find(field['id'])
        attr.update(item_attr)
      else
        ItemAttribute.new(item_attr).save!
      end
    end
  end
end
