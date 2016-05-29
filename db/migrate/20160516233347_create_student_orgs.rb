class CreateStudentOrgs < ActiveRecord::Migration
  def change
    create_table :student_orgs do |t|
      t.string :username
      t.string :encrypted_password
      t.string :reset_password_token
      t.datetime :reset_password_sent_at # can remove for now
      t.integer :sign_in_count, default: 0, null: false
      t.references :university
      t.text :description

      t.timestamps null: false
    end
  end
end
