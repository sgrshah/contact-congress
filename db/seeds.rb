require 'open-uri'
require_relative '../lib/tasks/data-finder'

rep_webpage = open('http://en.wikipedia.org/wiki/List_of_current_members_of_the_United_States_House_of_Representatives_by_seniority')
rep_doc = Nokogiri::HTML(rep_webpage)
rep_names_array = rep_doc.search('td:nth-child(2)').collect{|hyperlink| hyperlink.text}.select{|item| item.match('\A\w')}
rep_districts_array = rep_doc.search('td:nth-child(4)').collect{|hyperlink| hyperlink.text}.select{|item| item.match('\A\w')}

sen_webpage = open('http://en.wikipedia.org/wiki/List_of_current_United_States_Senators')
sen_doc = Nokogiri::HTML(sen_webpage)
sen_names_array = sen_doc.search('table:nth-child(16) td:nth-child(5) a').collect{|hyperlink| hyperlink.text}#.select{|item| item.match('\A\w')}
sen_districts_array = sen_doc.search('table:nth-child(16) td:nth-child(2)').collect{|hyperlink| hyperlink.text}#.select{|item| item.match('\A\w')}

fips = open('http://www.itl.nist.gov/fipspubs/fip55-3.htm')
fips_doc = Nokogiri::HTML(fips)
fips_array = fips_doc.search('table tr').collect{|row| row.text}
fips_array = fips_array.delete_if{|x| x.match('(\A\s)|(\A\D)') }
fips_array = fips_array.collect do |row| 
	a = row.split(" ")
	a.slice!(-2..-1)
	state_name_array = a.slice!(3..-1).join(" ")
	a << state_name_array
end

# districts = File.open('db/districts.txt')
# districts = districts.collect do |data|
# 	l = data.chomp
# 	l = l.split(",")
# 	l[0] = l[0].to_i
# 	l
# end

fips_array.each do |row|
	State.create(	:fips_code => row[1].to_i,
								:abbreviation => row[2],
								:name => row[3])
end

# districts.each do |district|
# 	CongressionalMapper.create(	:state => State.find_by_fips_code(district[0]),
# 															:zip_code => district[1],
# 															:district => district[2])
# end

rep_names_array.each_with_index do |congressman,index|
		Congressman.create(
			:name => congressman, 
			:state => State.find_by_abbreviation(rep_districts_array[index].split("-").first),
			:district => rep_districts_array[index].split("-").last, 
			:chamber => "House")
end

sen_names_array.each_with_index do |congressman,index|
		Congressman.create(:name => congressman, 
			:state => State.find_by_name(sen_districts_array[index]), 
			:chamber => "Senate")
end

# issues = ["Agriculture", "Animal Welfare", "Banking and Financial Services", "Budget", "Casework", "Census"]
# issues.each do |issue|
# 	Issue.create(:title => issue)
# end

states = ["AL", "AK", "AZ", "AR", "CA", "CO", "DE", 
					"DC", "FL", "GA", "HI", "ID", "IL", "IN", 
					"IA", "KS", "KY", "LA", "ME", "MD", "MA", 
					"MI", "MN", "MS", "MO", "MT", "NE", "NV", 
					"NH", "NJ", "NM", "NY", "NC", "ND", "OH", 
					"OK", "OR", "PA", "RI", "SC", "SD", "TN", 
					"TX", "UT", "VT", "VA", "WA", "WV", "WI", 
					"WY", "AS", "GU", "MP", "PR", "UM", "VI", 
					"FM", "MH", "PW"]

states.each do |state|
	collector = Congressional_Data_Collector.new
	collector.populate_congressmen(state,"active-record")
end