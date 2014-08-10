class CreateAlertas < ActiveRecord::Migration
  def up
    create_table :alertas do |t|
      t.integer "empleado_id"	
      t.datetime "fecha_vencimiento"
      t.string "tipo", :limit => 30
      t.string "observacion", :limit => 200
      t.boolean "vencido", :default => false
      t.timestamps
    end
    add_index("alertas", "empleado_id")
  end

  def down
  	drop_table :alertas
  end
end
