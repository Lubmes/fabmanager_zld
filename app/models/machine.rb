class Machine < ApplicationRecord
  has_many :handles, :dependent => :destroy
  has_many :fabmoments, :through => :handles
end
