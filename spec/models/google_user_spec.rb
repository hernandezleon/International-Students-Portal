# require 'rails_helper'

# RSpec.describe GoogleUser, type: :model do
# 	context 'with valid google credentials' do
#   		# this should actually be created in a factory
#   		let(:provider) { :google_oauth2 }
#   		let(:oauth) { OmniAuth::AuthHash.new provider: provider, uid: '1234' }
#   		before do
#     		OmniAuth.config.test_mode = true
#     		OmniAuth.config.mock_auth[provider] = oauth
#   		end

#   		it 'creates a new user' do
#     		expect { visit "/users/auth/#{provider}" }.to change(GoogleUser, :count).by(1)	
# 		end 
# 	end
# end
