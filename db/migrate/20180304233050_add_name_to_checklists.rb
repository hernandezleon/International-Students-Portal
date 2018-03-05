class AddNameToChecklists < ActiveRecord::Migration
  def change
  	  	add_column :checklists, :school_name, :string
  end
end
