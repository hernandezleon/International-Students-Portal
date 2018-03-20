class AddIndexToChecklists < ActiveRecord::Migration
  def change
  	add_index :checklists, :school_id, :unique => true
  end
end
