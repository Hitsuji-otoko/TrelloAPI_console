require 'googlebooks' # unless you're using Bundler
require 'pry'

def search_books
    books = GoogleBooks.search('The Great Gatsby')
    @first_book = books.first
    binding.pry

    @first_book.authors #=> 'F. Scott Fitzgerald'
    @first_book.isbn #=> '9781443411080'
    @first_book.image_link(:zoom => 6) #=> 'http://bks2.books.google.com/books?id=...'
end

def puts_bookinfo
    puts "#{@first_book.authors}"
    puts "#{@first_book.isbn}"
    puts "#{@first_book.image_link(:zoom => 6)}"
end

search_books
puts_bookinfo