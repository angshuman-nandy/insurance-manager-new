class Company < ApplicationRecord
  has_many :plan,:dependent => :destroy

  validates :name, presence: true
end
