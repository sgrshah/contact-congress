require 'nokogiri'
require 'mechanize'

class Congressional_Data_Collector
	
	def populate_congressmen(state, output_type)
		@agent = ::Mechanize.new
		@page = @agent.get('http://www.contactingthecongress.org/')
		@output_type = output_type
		congressmen_links = retreive_list_of_congressmen(state)
		congressmen_links.each do |congressman_link|
			populate_addresses(congressman_link)
		end
	end
	
	def retreive_list_of_congressmen(state)
		navigate_to_state_page(state)
		@agent.page.links.select{|link| link.text.include?(")")}
	end

	def navigate_to_state_page(state)
		search_form = @page.forms.first
		search_form.state = state
		@agent.submit(search_form, search_form.buttons.first)		
	end

	def navigate_to_congressman_page(link)
		link.click
	end

	def populate_addresses(link)
		navigate_to_congressman_page(link)
		populate_dc_address
		# populate_local_addresses
	end

	def set_active_record_for_congressman(name, address)
		::Congressman.find_by_name(name)
		street = address.match(/(?<=Senate|House).*(?=Washington)/)[0]
		zip_code = address.match(/(?<=D\.C\. ).*(?=-)/)[0]
		::Congressman.addresses << Address.create(street: street, city: "Washington", state_id: 8, zip_code: zip_code)
	end

	def populate_dc_address
		address_string = @agent.page.search('table:nth-child(2) td:nth-child(1) table:nth-child(1) tr:nth-child(1)').text
		congressman_name = address_string.match(/(?<=The Honorable )(.*)(?=United States)/)[0]
		if @output_type == "active-record"
			set_active_record_for_congressman(congressman_name, address_string)
		end
	end

	# def populate_local_addresses
	# end
end