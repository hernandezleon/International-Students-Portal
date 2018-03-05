class AddStepsAndRequirementsAndCountriesOfInternationalStudentsAndOrganizationsAndThingsToDoCityAndToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :steps, :text
    add_column :schools, :requirements, :text
    add_column :schools, :countries_of_international_students, :text
    add_column :schools, :organizations, :text
    add_column :schools, :things_to_do_near, :text
  end
end
