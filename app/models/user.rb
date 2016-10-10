class User < ActiveRecord::Base

  has_many :followers, dependent: :destroy

  def self.from_omniauth(auth_hash)
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update(
      name: auth_hash.info.name,
      image_url: auth_hash.info.image,
      url: auth_hash.info.urls.Twitter
    )
    user
  end
end
