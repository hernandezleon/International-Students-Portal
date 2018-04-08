class AddSchoolIdToUserchecklist < ActiveRecord::Migration
  def change
    add_column :userchecklists, :school_id, :integer
  end
end
