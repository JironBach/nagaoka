class Subject2 < ApplicationRecord
  belongs_to :subject1, foreign_key: 'subject1_id'
  has_many :lecture_items
end
