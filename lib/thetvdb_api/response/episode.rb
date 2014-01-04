class ThetvdbApi::Response::Episode < ThetvdbApi::Response
  def xml_parse
    multi_xml_parse.fetch('Data', {}).fetch('Episode', {})
  end
end
