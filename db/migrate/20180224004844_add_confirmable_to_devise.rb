class AddConfirmableToDevise < ActiveRecord::Migration
  def change
  	 change_table(:users) do |t|
      #t.boolean :confirmable, :default => false
      t.confirmable 
    end
  end
end
