class QuorasController < ApplicationController
  before_action :set_quora, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /quoras
  # GET /quoras.json
  def index
    
    @quoras = Quora.where(question_id: nil)
  end

  # GET /quoras/1
  # GET /quoras/1.json
  def show
    @answers = Quora.where(question_id: @quora.id)
  end

  # GET /quoras/new
  def new
    @quora = Quora.new
  end
  def new_1
    
    @quora = Quora.new
    @quora.question_id=params[:id]
  end
  # GET /quoras/1/edit
  def edit
  end

  # POST /quoras
  # POST /quoras.json
  def create
    @quora = Quora.new(quora_params)
    @quora.user_id = current_user.id
    respond_to do |format|
      if @quora.save
        if @quora.question_id.nil?
          format.html { redirect_to '/quoras', notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @quora }
        else
          AnswerMailer.answer_mailer(User.where(id: @quora.user_id).first.email)
          format.html { redirect_to '/quoras', notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @quora }
        end
        
      else
        format.html { render :new }
        format.json { render json: @quora.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quoras/1
  # PATCH/PUT /quoras/1.json
  def update
      if @quora.user_id==current_user.id
        respond_to do |format|
          if @quora.update(quora_params)
            format.html { redirect_to '/quoras', notice: 'Question was successfully updated.' }
            format.json { render :show, status: :ok, location: @quora }
          else
            format.html { render :edit }
            format.json { render json: @quora.errors, status: :unprocessable_entity }
          end
        end
      else
        respond_to do|format|
            format.html {redirect_to '/quoras', notice: 'Its none of your business.'}
        end
      end
  end

  # DELETE /quoras/1
  # DELETE /quoras/1.json
  def destroy

    quoraa=Quora.where(question_id: @quora.id)
    quoraa.destroy_all
    @quora.destroy
    respond_to do |format|
      format.html { redirect_to '/quoras', notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quora
      @quora = Quora.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quora_params
      params.require(:quora).permit(:content, :question_id)
    end
end
