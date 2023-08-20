class Topic < ApplicationRecord
  validates :name, uniqueness: { case_sensitive: false }, presence: true

  before_validation :sanitize_name

  has_many :notes

  private

  def sanitize_name
    self.name = name.strip.downcase if name.present?
  end
end
