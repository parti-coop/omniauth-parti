describe OmniAuth::Strategies::Parti do
  def app
    lambda do |_env|
      [200, {}, ["Hello."]]
    end
  end
  let(:strategy_class) { Class.new OmniAuth::Strategies::Parti }

  describe 'default options' do
    subject { strategy_class.new app }
    it 'has correct issuer' do
      expect(subject.options.issuer).to eq('https://v1.api.auth.parti.xyz')
    end

    it 'has default name' do
      expect(subject.options.name).to eq('parti')
    end

    it 'uses discovery' do
      expect(subject.options.discovery).to be true
    end

    it 'has default scope' do
      expect(subject.options.scope).to contain_exactly(:email, :openid)
    end

    it 'skips info' do
      expect(subject.options.skip_info).to be true
    end

    it 'has code response type' do
      expect(subject.options.response_type).to eq('code')
    end

    it 'has empty redirect uri' do
      expect(subject.options.client_options.redirect_uri).to eq(nil)
    end

    it 'has empty client id' do
      expect(subject.options.client_options.identifier).to eq(nil)
    end

    it 'has empty client secret' do
      expect(subject.options.client_options.secret).to eq(nil)
    end
  end

  describe 'settable options' do
    it 'sets issuer' do
      subject = strategy_class.new app, issuer: 'http://another-issuer.com'
      expect(subject.options.issuer).to eq('http://another-issuer.com')
    end

    it 'sets redirect uri' do
      subject = strategy_class.new app, client_options: { redirect_uri: 'http://redirect-uri.com' }
      expect(subject.options.client_options.redirect_uri).to eq('http://redirect-uri.com')
    end

    it 'sets client id' do
      subject = strategy_class.new app, client_options: { identifier: 'client-identifer' }
      expect(subject.options.client_options.identifier).to eq('client-identifer')
    end

    it 'sets client secret' do
      subject = strategy_class.new app, client_options: { secret: 'client-secret' }
      expect(subject.options.client_options.secret).to eq('client-secret')
    end
  end
end
