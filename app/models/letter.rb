class Letter < ActiveRecord::Base
	has_many :congressman_letters
	has_many :congressmen, through: :congressman_letters
	has_many :letter_issues
	has_many :issues, through: :letter_issues

	def set_congressmen
		relevant_congressmen = []
		cm = CongressionalMapper.find_all_by_zip_code(self.zip_code)
		cm.each do |mapper|
			mapper.state.congressmen.where(:district => mapper.district).each do |congressman|
				relevant_congressmen << congressman
			end
			mapper.state.congressmen.where(:chamber => "Senate").each do |congressman|
				relevant_congressmen << congressman
			end
		end
		self.congressmen = relevant_congressmen.uniq!
	end
end
