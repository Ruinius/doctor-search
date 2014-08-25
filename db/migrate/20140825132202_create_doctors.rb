class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :unit
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :specialty

      t.timestamps
    end
  end
end
