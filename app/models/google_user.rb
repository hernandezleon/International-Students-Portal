class GoogleUser < ActiveRecord::Base
	def self.from_omniauth(auth)
    	where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |google_user|
      		google_user.provider = auth.provider
      		google_user.uid = auth.uid
      		google_user.name = auth.info.name
      		google_user.oauth_token = auth.credentials.token
      		google_user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      		google_user.save!
    	end
  	end
end
