class AddRememberDigestToStudentOrgs < ActiveRecord::Migration
  def change
    add_column :student_orgs, :password_digest, :string
  end
end
