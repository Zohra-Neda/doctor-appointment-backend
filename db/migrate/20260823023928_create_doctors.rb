class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.integer :years_of_experience
      t.integer :patients_count
      t.time :start_time
      t.time :end_time
      t.boolean :premium
      t.text :about
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
