class AddWebsiteAndScholarshipToSchools < ActiveRecord::Migration
  def change
  	add_column :schools, :website,		:text
  	add_column :schools, :scholarships, :text
  end
end
