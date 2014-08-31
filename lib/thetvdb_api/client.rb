class ThetvdbApi::Client
  attr_reader :config

  def initialize(config = {})
    @config = config

    @config[:adapter] ||= :net_http
    @config[:language] ||= 'en'
  end

  def search
    @search ||= ThetvdbApi::Search.new(config)
  end

  def series
    @series ||= ThetvdbApi::Series.new(config)
  end

  def actor
    @actor ||= ThetvdbApi::Actor.new(config)
  end

  def banner
    @banner ||= ThetvdbApi::Banner.new(config)
  end

  def episode
    @episode ||= ThetvdbApi::Episode.new(config)
  end

  def update
    @update ||= ThetvdbApi::Update.new(config)
  end
end