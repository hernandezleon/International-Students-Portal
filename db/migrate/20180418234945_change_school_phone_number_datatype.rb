class ChangeSchoolPhoneNumberDatatype < ActiveRecord::Migration
  def change
  	change_column(:schools, :phone_number, :string)
  end
end
