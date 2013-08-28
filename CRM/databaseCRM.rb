class Database
	@@contacts = []
	@@id = 1

	def self.add_contact(contact)
		contact.id = @@id
		@@contacts << contact
		@@id += 1
	end


	def self.all_contacts
		@@contacts
	end

	def self.delete(contact)
		@@contacts.delete(contact)
	end

end