class AddSchoolIdToChecklists < ActiveRecord::Migration
  def change
    add_column :checklists, :school_id, :integer
  end
end
