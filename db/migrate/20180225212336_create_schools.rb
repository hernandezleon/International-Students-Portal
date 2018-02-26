class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :abbreviation
      t.text :description
      t.string :city
      t.string :state
      t.integer :semester_tuition
      t.text :athletics
      t.text :school_contact_name
      t.text :school_contact_email
      t.text :address
      t.integer :zip_code
      t.integer :phone_number

      t.timestamps null: false
    end
  end
end
