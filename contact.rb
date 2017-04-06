class Contact

  # Class variables and methods

  @@contacts = []
  @@id = 1

  def self.create(first_name, last_name, email, note)
    contact=Contact.new(first_name, last_name, email, note)
    @@contacts << contact
    return contact
  end


  def self.all
    @@contacts
  end

    def self.find_by_anything
        input = gets.chomp
        puts "~ ~ ~ ~ ~ ~ ~ ~"
        puts "Contact found:"
    @@contacts.each do |contact|
      if contact.first_name == input
        puts contact.print_contact
      elsif contact.last_name == input
         puts contact.print_contact
      elsif contact.email == input
         puts contact.print_contact
      elsif contact.note == input
         puts contact.print_contact
       elsif contact.id == input.to_i
          puts contact.print_contact
      else
        end
    end
  end

  def self.delete_contact
    input = gets.chomp
    puts "~ ~ ~ ~ ~ ~ ~ ~"
    puts "Contact found:"
@@contacts.each do |contact|
    if contact.id == input.to_i
      puts contact.print_contact
      puts contact.delete
    elsif contact.email == input
        puts contact.print_contact
        puts contact.delete
    else
      end
    end
  end

  def delete
    @@contacts.delete(self)
  end


  def self.find_by(attribute, value)
    case attribute
    when "first_name"
      @@contacts.select {|contact| contact.first_name == value}
    when "last_name"
      @@contacts.select {|contact| contact.last_name == value}
    when "email"
      return self if self.email == value
    when "note"
      return self if self.note == value
    end
  end

  def self.find(contact_id)
    @@contacts.each do |contact|
      if contact.id == contact_id
        return contact
      end
    end
  end


  def self.delete_all
    @@contacts.clear
  end


  def update(attribute, value)
    case attribute
    when "first_name"
      self.first_name = value
    when "last_name"
      self.last_name = value
    when "email"
      self.email = value
    when "note"
      self.note = value
    end
    return self
  end

  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :email
  attr_accessor :note
  attr_reader   :id

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end


  def full_name
    return "#{first_name} #{last_name}"
  end

  def print_contact
    print "##{self.id}, #{self.first_name} #{self.last_name}, #{self.email}, note: #{self.note}"
  end

  def self.print_all_contacts
    @@contacts.each do |contact|
      puts "##{contact.id}, #{contact.first_name} #{contact.last_name}, #{contact.email}, note: #{contact.note}"
    end
  end

end

# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!
