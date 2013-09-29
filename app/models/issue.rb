class Issue < ActiveRecord::Base
	has_many :letter_issues
	has_many :letters, through: :letter_issues
end
