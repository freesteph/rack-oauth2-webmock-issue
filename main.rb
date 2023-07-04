# frozen_string_literal: true

require 'rack'
require 'rack/oauth2'

class Api
  def fetch!
    client.access_token!.get('http://resource.com')
  end

  def client
    Rack::OAuth2::Client.new(
      identifier: 'my identifier',
      secret: 'my secret',
      token_endpoint: 'http://token-server.com'
    )
  end
end
