require 'happymapper'

class ThetvdbApi::Mappers::Actor
  include HappyMapper

  tag 'Actor'

  element :id, Integer
  element :image_path, String, tag: 'Image'
  element :name, String, tag: 'Name'
  element :role, String, tag: 'Role'
  element :sort_order, Integer, tag: 'SortOrder'

  def image_url
    image_path ? "http://thetvdb.com/banners/#{image_path}" : nil
  end
end
