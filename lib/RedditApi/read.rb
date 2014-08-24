module RedditApi
  class Read < Base
    def get_by_name
    end
    def subreddit(sort = 'hot', subreddit = nil, options = {})
      body = {}
      options.each do |key,_value|
        body[key.to_sym] = _value unless _value.nil? || value == 0
      end
      get(url: "/r/#{subreddit}/#{sort}", body: body)
    end
  end
end
