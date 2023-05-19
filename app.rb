class App 
    def initialize
        @people = []
        @books = []
        @rentals = []
    end

    def list_books 
        puts @book.map { |book| "Title: \"#{book.title}\", Author \"#{book.author}\"" }
    end

  
end