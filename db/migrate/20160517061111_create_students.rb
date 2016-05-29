class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :student_id, null: false
      t.references :student_org, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
