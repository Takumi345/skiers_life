class SkiComment < ApplicationRecord

  belongs_to :user
  belongs_to :ski

  validates :comment, presence: true

end
