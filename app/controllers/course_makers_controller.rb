class CourseMakersController < ApplicationController
  before_action :authenticate_teacher!, except: [:showcontent]
  layout "course_maker"
  before_action :set_course_maker, only: [:show, :edit, :update, :destroy]

  # GET /course_makers
  # GET /course_makers.json
  def index
    @teacher =current_teacher
    puts @teacher.email
    @course=Course.find(params[:course_id])
    
      puts @course.name
      @course_makers = CourseMaker.where(course: @course).order(pg_no: :asc)


  end

  # GET /course_makers/1
  # GET /course_makers/1.json
  def show
    @course=Course.find(params[:course_id])
    @course_maker.course=@course

  end

  # GET /course_makers/new
  def new
    @course=Course.find(params[:course_id])
    @course_maker = CourseMaker.new
    @course_maker.course=@course
  end

  # GET /course_makers/1/edit
  def edit

    puts params["course"]
    @course=Course.find(params[:course_id])
    @course_maker=CourseMaker.find(params[:id])
  end

  # POST /course_makers
  # POST /course_makers.json
  def create
    @course=Course.find(params[:course_id])
    puts @course.id
    @course_maker = CourseMaker.new(course_maker_params)
    @course_maker.course=@course

    respond_to do |format|
      if @course_maker.save
        format.html { redirect_to @course, notice: 'Course maker was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_makers/1
  # PATCH/PUT /course_makers/1.json
  def update
    respond_to do |format|
      if @course_maker.update(course_maker_params)
        format.html { redirect_to course_course_makers_path(@course_maker.course.id), notice: 'Course maker was successfully updated.' }
        format.json { render :show, status: :ok, location: @course_maker }
      else
        format.html { render :edit }
        format.json { render json: @course_maker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_makers/1
  # DELETE /course_makers/1.json
  def destroy
    @course=Course.find(params[:course_id])
    @course_maker.destroy
    respond_to do |format|
      format.html { redirect_to course_course_makers_url(@course), notice: 'Course maker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def showcontent
    puts "here"
    @course_maker_id=params["course_maker"]
    @course_id=params["course_id"]
    puts params["course_id"]
    puts @course_maker_id
    puts "here"
    puts "here"
    respond_to do |format|
      format.js{ }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_maker
      @course_maker = CourseMaker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_maker_params
      params.require(:course_maker).permit(:course_id, :pg_no, :pg_name, :section1, :section2, :section3, :section4)
    end


end
