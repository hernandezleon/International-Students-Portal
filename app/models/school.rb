class School < ActiveRecord::Base
	has_one :checklist

	searchable do
		text :name#, :boost => 5
		# text :abbreviation, :description, :city, :state, :semester_tuition,
		#  :athletics, :zip_code, :living_expense, :organizations
		# text :checklist do
		# 	checklist.map
		# end
	end
end
