class State < ActiveRecord::Base
	has_many :congressmen
	has_many :congressional_mappers
end
