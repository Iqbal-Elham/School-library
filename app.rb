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
        puts @book.map { |book| "Title: \"#{book.title}\", Author \"#{book.author}\"" }
    end

    def list_people 
        puts @people.map { |person| "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    end

    def create_person 
        print "Do you want to create a Student (1) or a Teacher (2)? [Input the number]: "
        option = gets.chomp
        print "Age: "
        age = gets.chomp
        print "Name: "
        name = gets.chomp
        case option
        when '1'
            print "Has parent permission? [Y/N]: "
            permission = gets.chomp.downcase
            people << Student.new(age, name, (permission == y ? true : false ))
        when '2'
            print "Specialization: "
            specialization = gets.chomp
            @people << Teacher.new(specialization, age, name)
        end
        puts "Person Created Successfully"
    end

    def create_book
        print "Title: "
        title = gets.chomp
        print "Author: "
        author = gets.chomp
        @book << Book.new(title, author)
        puts "Book Created Successfully"
    end
end