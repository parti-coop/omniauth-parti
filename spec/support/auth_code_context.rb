require 'rack/oauth2'

shared_context 'auth_code' do
  def auth_code_is_issued(**attrs)
    auth_api = Parti::OmniAuth::Test::AuthApi.new(
      client_id: Parti::OmniAuth::Test::Client.identifier,
      client_secret: Parti::OmniAuth::Test::Client.secret
    )
    response = auth_api.post '/test/auth-codes',
      attrs.to_json,
      'Content-Type' => 'application/json'

    expect(response.status).to eq(200)
    JSON.parse response.body, symbolize_names: true
  end
end
