class Note < ApplicationRecord
  belongs_to :topic

  validates :content, presence: true
end
