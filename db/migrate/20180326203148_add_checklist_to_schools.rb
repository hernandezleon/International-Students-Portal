class AddChecklistToSchools < ActiveRecord::Migration
  def change
  	  	add_column :schools, :checklist_id, :integer
  end
end
