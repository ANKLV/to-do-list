class Task < ApplicationRecord
  belongs_to :User

  def complete!
    self.completed = true
    save
  end
end
