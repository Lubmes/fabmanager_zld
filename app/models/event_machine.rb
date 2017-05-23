class EventMachine < ApplicationRecord
  belongs_to :event
  belongs_to :machine
end