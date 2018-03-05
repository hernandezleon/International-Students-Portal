class CreateChecklists < ActiveRecord::Migration
  def change
    create_table :checklists do |t|
      t.boolean :act_score
      t.boolean :sat_score
      t.boolean :high_school_transcript
      t.boolean :previous_college_transcript
      t.boolean :i_20
      t.boolean :visa_proof
      t.boolean :application_fee
      t.boolean :online_application

      t.timestamps null: false
    end
  end
end
