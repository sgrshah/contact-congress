class LetterStepsController < ApplicationController
	include Wicked::Wizard
	steps :basic_info, :choose_congressman, :personal_info, :content

	def show
		@letter = current_letter
		render_wizard
	end

	def update
		@letter = current_letter
		@letter.attributes = params[:letter]
		render_wizard @letter
	end

end
