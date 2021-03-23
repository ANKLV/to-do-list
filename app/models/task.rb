class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true

  def complete!
    self.completed = true
    save
  end
end
