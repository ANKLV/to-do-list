class Task < ApplicationRecord
  belongs_to :user

  validates :title, presence: true

  scope :search, ->(query) { where('title like :search', search: "%#{query}%") if query.present? }
end
