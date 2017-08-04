class CoursesController < ApplicationController
  before_action :authenticate_teacher!

  layout "course"
  before_action :set_course, only: [:show, :edit, :update, :destroy,]

  # GET /courses
  # GET /courses.json
  def index
    @teacher=current_teacher
    @courses = Course.where(teacher_id: @teacher.id)
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course=Course.find(params[:id])
    @course_maker=@course.course_makers
  end

  # GET /courses/new
  def new
    @teacher=current_teacher
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  def statusChange
    @course =Course.find(params[:course_id])
    @course.toggleStatus
    if @course.save
      respond_to do |format|
        format.js{}
        # format.html{ notice: 'Course was successfully created.'}

      end

    end
  end



  # POST /courses
  # POST /courses.json
  def create
    @teacher=current_teacher
    @course = Course.new(course_params)
    @course.teacher=@teacher

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :teacher_id)
    end
end
