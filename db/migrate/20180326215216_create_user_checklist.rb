class CreateUserChecklist < ActiveRecord::Migration
  def change
    create_table :user_checklists, id:false do |t|
    	t.integer :user_id
    	t.integer :checklist_id
    end
  end
end
