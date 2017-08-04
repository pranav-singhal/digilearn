class CourseMaker < ApplicationRecord
  belongs_to :course
  validates :pg_no, uniqueness: { scope: :course_id,
    message: " can only appear once here" }
end
