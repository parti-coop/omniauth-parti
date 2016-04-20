require 'parti/omniauth/test/auth_api'

shared_context 'client' do
  def client_exists(**attrs)
    auth_api = Parti::OmniAuth::Test::AuthApi.new(
      client_id: Parti::OmniAuth::Test::Client.identifier,
      client_secret: Parti::OmniAuth::Test::Client.secret,
    )
    data = attrs.slice :name, :redirect_uri
    response = auth_api.post '/test/clients', data.to_json, 'Content-Type' => 'application/json'
    expect(response.status).to eq(201)
    JSON.parse(response.body, symbolize_names: true)
  end
end
