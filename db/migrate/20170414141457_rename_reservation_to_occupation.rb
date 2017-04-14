class RenameReservationToOccupation < ActiveRecord::Migration[5.0]
  def change
    rename_table :reservations, :occupations
  end
end
