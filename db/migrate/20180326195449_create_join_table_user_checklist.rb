class CreateJoinTableUserChecklist < ActiveRecord::Migration
  def change
    create_join_table :users, :checklists do |t|
      t.index [:user_id, :checklist_id]
      t.index [:checklist_id, :user_id]
    end
  end
end
