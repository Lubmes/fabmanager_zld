class Fabmoment < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true

    has_many :handles, :dependent => :destroy
    has_many :machines, :through => :handles
end
