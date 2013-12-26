class ThetvdbApi::Response::SearchMultipleSeries < ThetvdbApi::Response
  include ThetvdbApi::Response::Collection

  def xml_parse
    multi_xml_parse.fetch('Data', {}).fetch('Series', [])
  end
end
