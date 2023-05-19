require './app'

def main
    app = App.new
    puts "Welcome to School Library App!\n"
    menu = "Please choose an option by entering a number:\n1 - List all books\n2 - List all people \n3 - Create a person\n4 - Create a book\n5 - Create a rental\n6 - List all rentals for a given person ID\n7 - Exit"
    get = 0
    while get != 7
        puts menu
        get = gets.chomp.to_i
        case get
        when 1
            app.list_books
        when 2
            app.list_people
        when 3
            app.create_person
        when 4
            app.create_book
        when 5 
            app.create_rental
        when 6
            app.list_rentals
        end
    end
    puts "Thank you"
end
main
