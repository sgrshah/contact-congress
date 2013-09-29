require 'open-uri'

rep_webpage = open('http://en.wikipedia.org/wiki/List_of_current_members_of_the_United_States_House_of_Representatives_by_seniority')
rep_doc = Nokogiri::HTML(rep_webpage)
rep_names_array = rep_doc.search('td:nth-child(2)').collect{|hyperlink| hyperlink.text}.select{|item| item.match('\A\w')}
rep_districts_array = rep_doc.search('td:nth-child(4)').collect{|hyperlink| hyperlink.text}.select{|item| item.match('\A\w')}

sen_webpage = open('http://en.wikipedia.org/wiki/List_of_current_United_States_Senators')
sen_doc = Nokogiri::HTML(sen_webpage)
sen_names_array = sen_doc.search('table:nth-child(16) td:nth-child(5) a').collect{|hyperlink| hyperlink.text}#.select{|item| item.match('\A\w')}
sen_districts_array = sen_doc.search('table:nth-child(16) td:nth-child(2)').collect{|hyperlink| hyperlink.text}#.select{|item| item.match('\A\w')}

rep_names_array.each_with_index do |congressman,index|
		Congressman.create(:name => congressman, :district => rep_districts_array[index], :chamber => "House")
end

sen_names_array.each_with_index do |congressman,index|
		Congressman.create(:name => congressman, :district => sen_districts_array[index], :chamber => "Senate")
end

issues = ["Agriculture", "Animal Welfare", "Banking and Financial Services", "Budget", "Casework", "Census"]
issues.each do |issue|
	Issue.create(:title => issue)
end