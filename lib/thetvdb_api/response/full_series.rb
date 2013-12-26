class ThetvdbApi::Response::FullSeries < ThetvdbApi::Response
  def parse
    unless @parse
      @parse = xml_parse
      episode_normalize
    end
    @parse
  end

  def xml_parse
    multi_xml_parse.fetch('Data', {})
  end

  def episode_normalize
    normalize('Episode')
  end

  def normalize(key)
    @parse[key] = [@parse[key]] if @parse[key].is_a?(Hash)
  end
end
