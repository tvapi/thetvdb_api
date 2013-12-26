class ThetvdbApi::Response::Episode < ThetvdbApi::Response
  def xml_parse
    multi_xml_parse.fetch('Episode', {})
  end
end
