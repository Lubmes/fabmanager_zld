class Program < ApplicationRecord
  has_many :interfaces, :dependent => :destroy
  has_many :fabmoments, :through => :interfaces
end
