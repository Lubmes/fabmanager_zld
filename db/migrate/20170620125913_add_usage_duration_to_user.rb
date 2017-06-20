class AddUsageDurationToUser < ActiveRecord::Migration[5.0]
  add_reference :usage_durations, :user, index: true
end
