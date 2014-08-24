module RedditApi
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end
  end

  class Configuration
    attr_accessor :client_id
    attr_accessor :redirect_uri
    attr_accessor :duration
    attr_accessor :scope
  end
end
