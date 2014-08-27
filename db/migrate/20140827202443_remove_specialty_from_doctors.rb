class RemoveSpecialtyFromDoctors < ActiveRecord::Migration
  def change
    remove_column :doctors, :specialty, :string
  end
end
