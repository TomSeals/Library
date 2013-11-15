class Library
  def initialize
    @books = []
  end

  def books
    @books
  end

  def list_books
    @books.each do |book|
      puts "#{book.title}, by #{book.author}, is #{book.status}"
    end
  end

  def borrowed_books
    @books.each do |book|
      if book.status == "checked out"
        puts "#{book.title} is checked out by #{book.borrower.name}"
      end
    end
  end

  def available_books
    @books.each do |book|
      if book.status == "available"
        puts "#{book.title} is available"
      end
    end
  end

  def add_book(book)
    unless @books.include?(book)
      @books << book
    else
      puts "This book has already been added to the library."
    end
  end

def check_out(user, book)
    if user.borrowed_books_count >= 2
      return "Sorry, that user already has two books"
    end

    if book.status == "available"
      book.borrower = user
      book.status = "checked out"
    else
      return "Sorry, this book is not available"
    end
end

  def check_in(book)
    if book.status == "checked out"
      book.borrower = nil
      book.status = "available"
    else
      "That book is not checked out from this library."
    end
  end
end

class Borrower
  def initialize(name)
    @borrowed_books = []
    @name = name
  end

  def borrowed_books
    @borrowed_books
  end

  def name
    @name
  end

  def borrowed_books_count
    @borrowed_books.length
  end

  def borrowed_books_list
    borrowed_books.each do |book|
      puts "#{book.title} is checked out by #{name}"
    end
  end
end

class Book
  def initialize(title, author)
    @title = title
    @author = author
    @status = "available"
    @borrower = nil
  end

  def author
    @author
  end

  def title
    @title
  end

  def borrower
    @borrower
  end

  def borrower=(new_value)
    @borrower = new_value
  end

  def status
    @status
  end

  def status=(new_value)
    @status = new_value
  end
end
