class RemoveIsFemaleFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :is_female
  	add_column :users, :gender, :string

  end
end
