class ThetvdbApi::Client
  attr_reader :adapter, :api_key, :language

  def initialize(options = {})
    @adapter = options[:adapter] || :net_http
    @api_key = options[:api_key]
    @language = options[:language] || 'en'
  end

  def search
    @search ||= ThetvdbApi::Search.new(self)
  end

  def series
    @series ||= ThetvdbApi::Series.new(self)
  end

  def actor
    @actor ||= ThetvdbApi::Actor.new(self)
  end

  def banner
    @banner ||= ThetvdbApi::Banner.new(self)
  end

  def episode
    @episode ||= ThetvdbApi::Episode.new(self)
  end

  def update
    @update ||= ThetvdbApi::Update.new(self)
  end
end