class AddPasswordDigest < ActiveRecord::Migration
  def up
  	remove_column "empleados", "hashed_password"
  	add_column "empleados", "password_digest", :string
  end
  def down
  	add_column "empleados", "hashed_password", :string, :limit => 40
  	remove_column "empleados", "password_digest"
  end
end
