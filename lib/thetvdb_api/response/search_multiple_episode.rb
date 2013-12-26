class ThetvdbApi::Response::SearchMultipleEpisode < ThetvdbApi::Response
  include ThetvdbApi::Response::Collection

  def xml_parse
    multi_xml_parse.fetch('Data', {}).fetch('Episode', [])
  end
end
