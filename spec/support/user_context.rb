require 'parti/omniauth/test/users_api'

shared_context 'user' do
  def user_exists(**args)
    users_api = Parti::OmniAuth::Test::UsersApi.new
    response = users_api.post '/v1/test/users', args
    expect(response.status).to eq(200)
    JSON.parse(response.body, symbolize_names: true).first
  end
end
