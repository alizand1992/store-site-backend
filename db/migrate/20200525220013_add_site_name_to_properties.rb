class AddSiteNameToProperties < ActiveRecord::Migration[6.0]
  def change
    SiteProperty.new(
      name: 'DISPLAY_FIELD_NAMES',
      value: '0',
      description: 'Show field names in the item page.',
      value_type: SiteProperty::CHECKBOX
    ).save!

    SiteProperty.new(
      name: 'SITE_NAME',
      value: 'My Site',
      description: 'Site name as it appears in the navigation bar.',
      value_type: SiteProperty::TEXT
    ).save!
  end
end
