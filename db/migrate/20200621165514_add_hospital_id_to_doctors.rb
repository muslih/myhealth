class AddHospitalIdToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :hospital_id, :integer
  end
end
