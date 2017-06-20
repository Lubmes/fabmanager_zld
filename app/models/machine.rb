class Machine < ApplicationRecord
  has_many :handles, :dependent => :destroy
  has_many :fabmoments, :through => :handles
  # Machine is fed with materials.
  # has_many :feeds, :dependent => :destroy
  # has_many :materials, :through => :feeds

  # Machine occupier.
  belongs_to :usage_duration, optional: true
end
