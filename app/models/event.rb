class Event < ApplicationRecord
  has_many :event_machines, :dependent => :destroy
  has_many :machines, :through => :event_machines
  enum event_type: [:renting, :occupation]

  # def as_json(options = {})
  #   super options.merge(methods: [:color])
  # end
  #
  # def self.color
  #   'ff0000'
  # end

  # def title
  #   self.title = title + "machine xyz"
  # end
end
