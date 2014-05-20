class ThetvdbApi::Client
  attr_reader :options

  def initialize(options = {})
    @options = options

    @options[:adapter] ||= :net_http
    @options[:language] ||= 'en'
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