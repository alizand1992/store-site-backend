class AddMenuNamingProperties < ActiveRecord::Migration[6.0]
  def change
    SiteProperty.new(
      name: 'MENU_1',
      value: 'Home',
      description: 'Title for menu 1',
      value_type: SiteProperty::TEXT
    ).save!

    SiteProperty.new(
      name: 'MENU_2',
      value: 'Posts',
      description: 'Title for menu 2',
      value_type: SiteProperty::TEXT
    ).save!
  end
end
