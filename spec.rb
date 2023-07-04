# frozen_string_literal: true

require_relative './spec_helper'
require_relative './main'

describe Api do
  before do
    stub_request(:post, 'http://token-server.com/')
      .with(
        body: { 'grant_type' => 'client_credentials' },
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization' => 'Basic bXkraWRlbnRpZmllcjpteStzZWNyZXQ=',
          'Content-Type' => 'application/x-www-form-urlencoded',
          'User-Agent' => 'Rack::OAuth2 (2.2.0)'
        }
      )
      .to_return(status: 200, body: JSON.generate({ access_token: 'token' }), headers: {})
  end

  it "doesn't agree on the return type" do
    expect(subject.fetch!).to be_nil
  end
end
