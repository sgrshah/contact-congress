class LetterIssue < ActiveRecord::Base
	belongs_to :letter
	belongs_to :issue
end
