module PartiAuth
  class PartiAuthError < StandardError
  end

  class Unauthorized < PartiAuthError
  end
end

