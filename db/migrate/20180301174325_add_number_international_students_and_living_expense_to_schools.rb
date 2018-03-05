class AddNumberInternationalStudentsAndLivingExpenseToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :num_students, :integer
    add_column :schools, :living_expense, :integer
  end
end
