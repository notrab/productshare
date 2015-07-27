class AuthMicroService
  def initialize(auth_hash)
    @auth_hash = auth_hash
  end

  def find_or_create
    find_by_hash || create_from_hash
  end

  private

  attr_accessor :auth_hash

  def find_by_hash
    user = User.find_by(uid: auth_hash.uid)
    update_provider_info(user)
    user
  end

  def create_from_hash
    User.create do |user|
      user.uid = auth_hash.uid
      user.username = auth_hash.info.nickname
      user.name = auth_hash.info.name
      user.avatar = auth_hash.info.image
    end
  end
end
