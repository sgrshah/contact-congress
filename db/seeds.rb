require 'open-uri'

webpage = open('http://en.wikipedia.org/wiki/List_of_current_members_of_the_United_States_House_of_Representatives_by_seniority')
doc = Nokogiri::HTML(webpage)
names_array = doc.search('td:nth-child(2)').collect{|hyperlink| hyperlink.text}.select{|item| item.match('\A\w')}
districts_array = doc.search('td:nth-child(4)').collect{|hyperlink| hyperlink.text}.select{|item| item.match('\A\w')}



names_array.each do |congressman|
	districts_array.each do |district|
		Congressman.create(:name => congressman, :district => district)
	end
end