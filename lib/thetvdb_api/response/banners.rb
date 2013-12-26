class ThetvdbApi::Response::Banners < ThetvdbApi::Response
  include ThetvdbApi::Response::Collection

  def xml_parse
    multi_xml_parse.fetch('Banners', {}).fetch('Banner', [])
  end
end
