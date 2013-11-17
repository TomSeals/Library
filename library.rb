class Library
  def initialize
    @books = []
  end

  attr_reader :books

  def list_books
    @books.each do |book|
      puts "#{book.title} by #{book.author} is #{book.status}"
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
      puts "This book has already been added"
    end
  end

  def check_out(user, book)
    if book.status != "available"
      return "Sorry that book is not available"
    end

    if user.borrowed_books_count < 2
      user.borrowed_books << book
      book.borrower = user
      book.status = "checked out"
    else
      "This user currently has too many books. Please return books to check out again."
    end
  end

  def check_in(book)
    if book.status == "checked out"
      book.borrower = nil
      book.status = "available"
    else
      "This book is not available."
    end
  end
end

class Borrower
  def initialize(name)
    @borrowed_books = []
    @name = name
  end

  attr_reader :borrowed_books
   
  attr_reader :name

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
  # books should be able to have info saved about them
  def initialize(title, author)
    @title = title
    @author = author
    @status = "available"
    @borrower = nil
  end

  attr_reader :author

  attr_accessor :borrower

  attr_reader :status

  attr_writer :status

  attr_reader :title
end