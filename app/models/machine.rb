class Machine < ApplicationRecord
  acts_as_bookable time_type: :range, capacity_type: :open
  has_many :handles, :dependent => :destroy
  has_many :fabmoments, :through => :handles
  # Machine is fed with materials.
  # has_many :feeds, :dependent => :destroy
  # has_many :materials, :through => :feeds
end
