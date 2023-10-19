class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :identification, default: ''
      t.string :name, default: ''
      t.float :mass, default: 0
      t.float :height, default: 0
      t.integer :systolic_pressure, default: 0
      t.integer :diastolic_pressure, default: 0

      t.timestamps
    end
  end
end
