class Letter < ActiveRecord::Base
	has_many :congressman_letters
	has_many :congressman, through: :congressman_letters
	has_many :letter_issues
	has_many :issues, through: :letter_issues
end
