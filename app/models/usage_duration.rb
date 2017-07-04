class UsageDuration < ApplicationRecord
  has_one :machine
  belongs_to :user
end
