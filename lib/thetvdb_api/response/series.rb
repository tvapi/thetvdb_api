class ThetvdbApi::Response::Series < ThetvdbApi::Response
  def xml_parse
    multi_xml_parse.fetch('Series', {})
  end
end
