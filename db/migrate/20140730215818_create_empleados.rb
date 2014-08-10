class CreateEmpleados < ActiveRecord::Migration
  def up
    create_table :empleados do |t|

      t.string "nombres", :limit => 50
      t.string "apellidos", :limit => 50
      t.string "rut", :limit => 20, :null => false
      t.string "email", :default => "", :null => false
      t.string "username", :limit => 10, :default => "", :null => false
      t.string "hashed_password", :limit => 40
      t.integer "perfil_id"
      # Agregar id_perfil
      # Agregar index a id
      t.timestamps
    end
    add_index("empleados", "rut")
  end

  def down
  	 drop_table :empleados
  end
end
