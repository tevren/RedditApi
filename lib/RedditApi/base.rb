module RedditApi
  class Base
    REDDIT_API_URL = 'https://ssl.reddit.com/'
    def initialize
      @conn = Faraday.new(url: REDDIT_API_URL) do |faraday|
        faraday.request :json
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end
    end
    def get(url:, body:)
      @conn.get do |req|
        req.url url
        req.body = body
        yield req if block_given?
      end
    end
    def post(url:, body:)
      @conn.post do |req|
        req.url url
        req.body = body
        yield req if block_given?
      end
    end
    def sanitize_scopes(scopes = nil)
      allowed_scopes = ['modposts', 'identity', 'edit', 'flair', 'history', 
        'modconfig', 'modflair', 'modlog', 'modposts', 'modwiki', 'mysubreddits', 
        'privatemessages', 'read', 'report', 'save', 'submit', 'subscribe', 
        'vote', 'wikiedit', 'wikiread']
      scopes_array = scopes.split(',') unless scopes.nil?
      valid = true
      scopes_array.each do | scope|
        valid = false unless allowed_scopes.include?(scope)
        break if valid = false
      end
      if valid = true
        scopes
      else
        nil
      end
    end
  end
end
