module PartiAuth
  class Account
    attr_reader :access_token, :id_info, :id_token

    def initialize(id_token:, access_token: nil, id_info: {})
      @id_token = id_token
      @access_token = access_token
      @id_info = id_info
    end

    def identifier
      id_info.sub
    end

    def email
      id_info.email
    end

    def nickname
      id_info.nickname
    end
  end
end
