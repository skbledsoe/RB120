=begin
prob: complete the program so that the test case results in the expected output

notes:


algo:
  -create a getter method for author and title 

=end

class Book
  attr_reader :author, :title

  # def title
  #   @title
  # end

  # def author
  #   @author
  # end

  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)


#The author of "Snow Crash" is Neil Stephenson.
#book = "Snow Crash", by Neil Stephenson.