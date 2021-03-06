class Congressman < ActiveRecord::Base
	has_many :congressman_letters
	has_many :letters, through: :congressman_letters
	belongs_to :state
	has_many :addresses
end
