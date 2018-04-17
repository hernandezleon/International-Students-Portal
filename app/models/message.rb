class Message < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :users
	validates :title, presence: true
end
