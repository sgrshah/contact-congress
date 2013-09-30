class Letter < ActiveRecord::Base
	has_many :congressman_letters
	has_many :congressman, through: :congressman_letters
	has_many :letter_issues
	has_many :issues, through: :letter_issues

	def relevant_congressmen
		relevant_congressmen = []
		cm = CongressionalMapper.find_by_zip_code(self.zip_code)
		cm.state.congressmen.where(:district => cm.district).each do |congressman|
			relevant_congressmen << congressman
		end
		cm.state.congressmen.where(:chamber => "Senate").each do |congressman|
			relevant_congressmen << congressman
		end
		relevant_congressmen
	end
end
