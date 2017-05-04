class Event < ApplicationRecord
  enum event_type: [:renting, :occupation]
end
