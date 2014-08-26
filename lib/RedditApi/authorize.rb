module RedditApi
  class Authorize < Base
    def authorize(scopes = nil)
      scopes = sanitize_scopes(scopes).nil? ? sanitize_scopes(scopes) : 'identity'
      body = { client_id: RedditApi.configuration.client_id, 
        response_type: 'code', 
        state: SecureRandom.hex(16), 
        redirect_uri: RedditApi.configuration.redirect_uri,
        duration: RedditApi.configuration.duration,
        scope: scopes}
      get(url: 'api/v1/authorize', body: body)
    end
  end
end
