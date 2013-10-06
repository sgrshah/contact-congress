class Address < ActiveRecord::Base
	belongs_to :congressman
	belongs_to :state
end
