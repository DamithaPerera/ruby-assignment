class NullJwtRevocationStrategy
  def self.blacklisted?(jti)
    false
  end

  def self.revoke_by_jti(jti)
    # No-op
  end

  def self.revoke_all_for_user(user)
    # No-op
  end
end
