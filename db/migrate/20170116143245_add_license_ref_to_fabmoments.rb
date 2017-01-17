class AddLicenseRefToFabmoments < ActiveRecord::Migration[5.0]
  def change
    add_reference :fabmoments, :license, foreign_key: true
  end
end
