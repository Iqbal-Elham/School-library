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
    
end