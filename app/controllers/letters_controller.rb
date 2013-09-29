# require 'prawn.rb'

class LettersController < ApplicationController
  before_action :set_letter, only: [:show, :edit, :update, :destroy]

  # GET /letters
  # GET /letters.json
  def index
    @letters = Letter.all
  end

  # GET /letters/1
  # GET /letters/1.json
  def show
  end

  # GET /letters/new
  def new
    @letter = Letter.new
  end

  # GET /letters/1/edit
  def edit
  end

  # POST /letters
  # POST /letters.json
  def create
    @letter = Letter.new
      if @letter.save
        session[:letter_id] = @letter.id
        redirect_to letter_steps_path
        # format.html { redirect_to @letter, notice: 'Letter was successfully created.' }
        # format.json { render action: 'show', status: :created, location: @letter }
      else
        render action: 'new'
        # format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /letters/1
  # PATCH/PUT /letters/1.json
  def update
    # pdf = Prawn::Document.new
    # pdf.text(@letter.content)
    # pdf.render_file "assignment.pdf"
    respond_to do |format|
      if @letter.update(letter_params)
        format.html { redirect_to @letter, notice: 'Letter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letters/1
  # DELETE /letters/1.json
  def destroy
    @letter.destroy
    respond_to do |format|
      format.html { redirect_to letters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter
      @letter = Letter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def letter_params
    #   params.require(:letter).permit(:content, :congressman_id)
    #   # params[:letter]
    # end
end
