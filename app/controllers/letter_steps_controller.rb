class LetterStepsController < ApplicationController
	include Wicked::Wizard
	steps :basic_info, :choose_congressman, :personal_info, :content

	def show
		@letter = current_letter
		render_wizard
	end

	def update
		@letter = current_letter
		@letter.attributes = letter_params
		render_wizard @letter
	end
	
	private

  def letter_params
    params.require(:letter).permit(:zip_code, :content, :congressman_id)
    # params[:letter]
  end
end
