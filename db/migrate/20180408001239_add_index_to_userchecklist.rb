class AddIndexToUserchecklist < ActiveRecord::Migration
  def change
  	add_index :userchecklists, [:userid, :school_id], :unique => true
  end
end
