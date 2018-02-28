class AddPhoneNumberToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :phone_number, :integer
  end
end
