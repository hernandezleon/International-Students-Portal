class School < ActiveRecord::Base
	has_one :checklist
	#has_many :userchecklists
	include PgSearch
  	pg_search_scope :search, against: [:name, :city, :state, :semester_tuition, :requirements,
  										:athletics, :abbreviation]
	# searchable do
	# 	text :name, :boost => 5
	# 	 text :abbreviation, :description, :city, :state, :semester_tuition,
	# 	  :athletics, :zip_code, :living_expense, :organizations
	# 	 text :checklist do
	# 	 	checklist.map
	# 	 end
	# end
end
