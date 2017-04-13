class Renting < ApplicationRecord
  attribute :time_start, :datetime
  attribute :time_end, :datetime
  # attr_accessor :description

  #
  # store :properties,
  #       acessors: %i(color size available_on),
  #       coder: JSON

  # self.columns_hash['time_start'] = OpenStruct.new(type: :datetime, klass: DateTime)
  # self.columns_hash['time_end'] = OpenStruct.new(type: :datetime, klass: DateTime)

  # def time_start
  #   return super.to_datetime if super.respond_to?(:to_datetime)
  #   DateTime.parse(super)
  # end
  # def time_end
  #   return super.to_datetime if super.respond_to?(:to_datetime)
  #   DateTime.parse(super)
  # end
end
