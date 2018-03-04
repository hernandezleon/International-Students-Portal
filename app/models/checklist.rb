class Checklist < ActiveRecord::Base
	belongs_to :school, :class_name => 'School', :foreign_key => 'school_id'

end
