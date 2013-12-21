require 'happymapper'

class ThetvdbApi::Mappers::Banner
  include HappyMapper

  tag 'Banner'

  element :id, Integer
  element :path, String, tag: 'BannerPath'
  element :thumbnail_path, String, tag: 'ThumbnailPath'
  element :vignette_path, String, tag: 'VignettePath'
  element :type, String, tag: 'BannerType'
  element :type2, String, tag: 'BannerType2'
  element :language, String, tag: 'Language'
  element :season, Integer, tag: 'Season'
  element :rating, Float, tag: 'Rating'
  element :rating_count, Integer, tag: 'RatingCount'
  element :series_name, String, tag: 'SeriesName'
  element :colors, String, tag: 'Colors'

  def url
    path ? "http://thetvdb.com/banners/#{path}" : nil
  end

  def thumbnail_url
    thumbnail_path ? "http://thetvdb.com/banners/#{thumbnail_path}" : nil
  end

  def vignette_url
    vignette_path ? "http://thetvdb.com/banners/#{vignette_path}" : nil
  end
end
