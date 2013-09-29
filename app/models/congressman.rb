class Congressman < ActiveRecord::Base
	has_many :congressman_letters
	has_many :letters, through: :congressman_letters
end
