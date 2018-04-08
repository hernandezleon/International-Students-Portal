class RenameUserToUserid < ActiveRecord::Migration
  def change
  	rename_column :userchecklists, :user, :userid
  end
end
