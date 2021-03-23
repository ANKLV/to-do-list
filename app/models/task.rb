class Task < ApplicationRecord
  belongs_to :user
  validates :title, presense: true

  def complete!
    self.completed = true
    save
  end
end
