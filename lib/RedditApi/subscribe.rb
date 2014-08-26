module RedditApi
  class Subscribe < Base
    def subscribe(action, subreddit, modhash)
      body = { action: action, sr: subreddit, uh: modhash}
      post(url: 'api/subscribe', body: body)
    end
  end
end
