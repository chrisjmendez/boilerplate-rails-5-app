class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.integer :zip_code
      t.string :zip_code_type
      t.string :city
      t.string :state
      t.float :lat
      t.float :lng
      t.string :country
      t.string :location_text
      t.string :location
      t.integer :estimated_population
      t.decimal :total_wages

      t.timestamps
    end
  end
end
