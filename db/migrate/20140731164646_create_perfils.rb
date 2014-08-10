class CreatePerfils < ActiveRecord::Migration
  def up
    create_table :perfils do |t|
      t.string "tipo", :limit => 30
      t.string "observacion", :limit => 250
      t.timestamps
    end
  end

  def down
  	drop_table :perfils
  end
end
