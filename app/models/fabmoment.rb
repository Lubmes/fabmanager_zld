class Fabmoment < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    # Fabmoment to interface with programs. 
    has_many :interfaces, :dependent => :destroy
    has_many :programs, :through => :interfaces
    # Fabmoment to handle machines. 
    has_many :handles, :dependent => :destroy
    has_many :machines, :through => :handles
    # Fabmoment to feed materials.
    has_many :feeds, :dependent => :destroy
    has_many :materials, :through => :feeds
end
