require './student'
require './teacher'
require './book'
require './rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts(@books.map { |book| "Title: \"#{book.title}\", Author \"#{book.author}\"" })
  end

  def list_people
    puts(@people.map { |person| "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" })
  end

  def create_person
    print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]: '
    option = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case option
    when '1'
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp.downcase
      @people << Student.new(age, name, parent_permission: (permission == 'y'))
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      @people << Teacher.new(specialization, age, name)
    end
    puts 'Person Created Successfully'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book Created Successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.map.with_index { |book, idx| puts "#{idx}) Title: \"#{book.title}\", Author: #{book.author}" }
    book_idx = gets.chomp.to_i
    puts 'Select a person from the following list by number (not ID)'
    @people.map.with_index do |person, idx|
      puts "#{idx}) Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    end
    person_idx = gets.chomp.to_i
    print 'Date (YYYY/MM/DD): '
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_idx], @people[person_idx])
    puts 'Rental Created Successfully'
  end

  def list_rentals
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals:'
    puts(@rentals.filter_map do |rental|
           if rental.person.id == person_id
             "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
           end
         end)
  end
end
