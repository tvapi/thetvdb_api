class ThetvdbApi::Response::Actors < ThetvdbApi::Response
  include ThetvdbApi::Response::Collection

  def xml_parse
    multi_xml_parse.fetch('Actors', {}).fetch('Actor', [])
  end
end
