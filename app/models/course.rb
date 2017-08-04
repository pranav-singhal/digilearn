class Course < ApplicationRecord
  belongs_to :teacher
  has_many :course_makers, dependent: :destroy

  def toggleStatus
    @course=Course.where(id: self.id, teacher_id:self.teacher.id).first
    if @course.status==0
      @course.status=1
    else
      @course.status=0
    end
    @course.save!
  end

  def statusString
    @course= Course.where(id: self, teacher_id:self.teacher.id).first
    if @course.status==0
      return "publish this course"
    else
      return "retract this course"
    end
  end
  def alertString
    @course= Course.where(id: self, teacher_id:self.teacher_id).first
    if @course.status==0
      return "are u sure u want to publish this course?"
    else
      return "are u sure u want to retract this course?"
    end

  end


  

end
