class ThetvdbApi::Client
  attr_reader :options

  def initialize(options = {})
    @options = options

    @options[:adapter] ||= :net_http
  end

  def search
    @search ||= ThetvdbApi::Search.new(options)
  end

  def series
    @series ||= ThetvdbApi::Series.new(options)
  end

  def actor
    @actor ||= ThetvdbApi::Actor.new(options)
  end
  
  def server
    @server ||= ThetvdbApi::Server.new(options)
  end

  def banner
    @banner ||= ThetvdbApi::Banner.new(options)
  end

  def episode
    @episode ||= ThetvdbApi::Episode.new(options)
  end

  def update
    @update ||= ThetvdbApi::Update.new(options)
  end
end
