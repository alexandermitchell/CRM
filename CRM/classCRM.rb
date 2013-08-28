require "contact_CRM"
require "databaseCRM"

class CRM

	def main_menu
		begin 
			puts "Choose an option from the menu:"
			puts "[1] Add a contact"
			puts "[2] Modify a contact"
			puts "[3] Delete a contact"
			puts "[4] Display all contacts"
			puts "[5] Display attribute"
			puts "[6] Exit"
			selected_option = gets.to_i
			user_selection(selected_option)
		end while selected_option != 6
	end

	def user_selection(selected_option)

		case selected_option
			when 1
				add_contact
			when 2
				attribute_menu
				modify_contact
			when 3
				attribute_menu
				delete_contact
			when 4
				display_all
			when 5
				display_attribute
			when 6
				
			else 
				puts "not a valid option, choose another"
		end
	end

	def add_contact
		puts "Enter a first name:"
		first_name = gets.chomp
		puts "Enter a last name:"
		last_name = gets.chomp
		puts "Enter an email address:" 
		email = gets.chomp
		puts "Enter a note"
		note = gets.chomp
		contact = Contact.new(first_name, last_name, email, note)
		Database.add_contact(contact)
	end

	def attribute_menu
		puts "Select an attribute to specify contact:"
		puts "[1] First name"
		puts "[2] Last name"
		puts "[3] Email"
		puts "[4] Note"
		attribute_option = gets.to_i
		attribute_selection(attribute_option)
	end

	def attribute_selection(attribute_option)

		case attribute_option
			when 1
				puts "Enter the first name of the contact:"
				first_name = gets.chomp.capitalize
				Database.all_contacts.each do |contact|
					if contact.first_name == first_name
						@contact = contact
					else 
						puts "Couldn't find a contact with the first name of #{first_name}, try again:"
						attribute_menu
					end
				end
			when 2
				puts "Enter the last name of the contact:"
				last_name = gets.chomp.capitalize
				Database.all_contacts.each do |contact|
					if contact.last_name == last_name
						@contact = contact
					else 
						puts "Couldn't find a contact with the last name of #{last_name}, try again:"
						attribute_menu
					end
				end
			when 3
				puts "Enter the email of the contact:"
				email = gets.chomp
				Database.all_contacts.each do |contact|
					if contact.email == email
						@contact = contact
					else 
						puts "Couldn't find a contact with the email #{email}, try again:"
						attribute_menu
					end
				end

			when 4
				puts "Enter the note of the contact:"
				note = gets.chomp
				Database.all_contacts.each do |contact|
					if contact.note == note
						@contact = contact
					else 
						puts "Couldn't find a contact with a note matching #{contact}, try again:"
						attribute_menu
					end
				end
		end
	end

	def modify_contact

		puts "Select an attribute to modify for #{@contact.first_name} #{@contact.last_name}:"
		puts "[1] First name"
		puts "[2] Last name"
		puts "[3] Email"
		puts "[4] Note"
		modify_option = gets.to_i

		case modify_option

			when 1
				puts "Enter a new first name:"
				@contact.first_name = gets.chomp.capitalize 
				puts "Contact's name has been updated to #{@contact.first_name} #{@contact.last_name}"
				puts @contact.inspect
			when 2
				puts "Enter a new last name:"
				@contact.last_name = gets.chomp.capitalize
				puts "Contact's name has been updated to #{@contact.first_name} #{@contact.last_name}"
			when 3
				puts "Enter a new email address for #{@contact.first_name} #{@contact.last_name}:"
				@contact.email = gets.chomp
				puts "Contact's email has been updated to #{@contact.email}"
			when 4
				puts "Enter a new note for #{@contact.first_name} #{@contact.last_name}"
				@contact.note = gets.chomp
				puts "#{@contact.first_name} #{@contact.last_name}'s note has been updated"
		end

	end

	def delete_contact
		puts "Are you sure you want to delete #{@contact.first_name} #{@contact.last_name}?"
		puts "[1] Yes"
		puts "[2] No"
		confirmation = gets.to_i
		if confirmation == 1 
			Database.delete(@contact)
			puts "Contact has been deleted"
		end
	end

	def display_all
		Database.all_contacts.each do |contact|
			puts "#{contact.first_name} #{contact.last_name}"
		end
	end

	def display_attribute
		puts "Choose an attribute to display:"
		puts "[1] First name"
		puts "[2] Last name"
		puts "[3] Email"
		puts "[4] Note"
		dis_attribute = gets.to_i

		case dis_attribute

			when 1
				Database.all_contacts.each do |contact| 
					puts contact.first_name
				end
			when 2
				Database.all_contacts.each do |contact| 
					puts contact.last_name
				end
			when 3
				Database.all_contacts.each do |contact| 
					puts contact.email
				end
			when 4
				Database.all_contacts.each do |contact| 
					puts contact.note
				end
		end

	end

end

newCRM = CRM.new
newCRM.main_menu