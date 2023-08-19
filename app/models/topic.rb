class Topic < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  has_many :notes
end
