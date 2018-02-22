class Message < ActiveRecord::Base
	#elongs_to :user
	has_many :comments, dependent: :destroy
end
