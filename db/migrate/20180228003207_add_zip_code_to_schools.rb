class AddZipCodeToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :zip_code, :integer
  end
end
