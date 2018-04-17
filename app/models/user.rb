class User < ActiveRecord::Base
	has_many :messages
	has_many :comments
  has_many :userchecklists
  has_and_belongs_to_many :checklists
  # validates :name, :city, :state, :zip_code, :steps, :school_contact, :organizations, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #,:confirmable

   def active_for_authentication? 
   	super && approved? 
   end 
  
  	def inactive_message 
    	if !approved? 
      	:not_approved 
    	else 
      		super # Use whatever other message 
    	end 
  	end

end
