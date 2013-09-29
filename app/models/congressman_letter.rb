class CongressmanLetter < ActiveRecord::Base
	belongs_to :congressman
	belongs_to :letter
end
