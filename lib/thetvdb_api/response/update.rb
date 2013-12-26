class ThetvdbApi::Response::Update < ThetvdbApi::Response
  def parse
    unless @parse
      @parse = xml_parse
      series_normalize
      episode_normalize
      banner_normalize
    end
    @parse
  end

  def xml_parse
    multi_xml_parse.fetch('Data', {})
  end

  def series_normalize
    normalize('Series')
  end

  def episode_normalize
    normalize('Episode')
  end

  def banner_normalize
    normalize('Banner')
  end

  def normalize(key)
    @parse[key] = [@parse[key]] if @parse[key].is_a?(Hash)
  end
end
