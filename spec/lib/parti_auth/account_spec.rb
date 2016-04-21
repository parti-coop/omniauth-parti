require 'parti_auth/account'

describe PartiAuth::Account do
  let(:id_info) { double('id_info') }

  subject {
    PartiAuth::Account.new(
      access_token: 'fake-access-token',
      id_info: id_info,
      id_token: 'fake-id-token'
    )
  }

  it 'returns access_token' do
    expect(subject.access_token).to eq('fake-access-token')
  end

  it 'returns id_info' do
    expect(subject.id_info).to eq(id_info)
  end

  it 'returns id_token' do
    expect(subject.id_token).to eq('fake-id-token')
  end

  it 'returns account identifier' do
    allow(id_info).to receive(:sub) { 'fake-identifier' }
    expect(subject.identifier).to eq('fake-identifier')
  end

  it 'returns account email' do
    allow(id_info).to receive(:email) { 'fake-email' }
    expect(subject.email).to eq('fake-email')
  end

  it 'returns account nickname' do
    allow(id_info).to receive(:nickname) { 'fake-nickname' }
    expect(subject.nickname).to eq('fake-nickname')
  end
end
