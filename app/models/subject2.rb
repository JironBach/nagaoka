class Subject2 < ApplicationRecord
  belongs_to :subject1
  has_many :lecture_items
end
